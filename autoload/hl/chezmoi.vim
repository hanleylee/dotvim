" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

function! s:get_target_file(original_abs_path)
    let fixed_name = s:get_fixed_name(fnamemodify(a:original_abs_path, ':t'))

    if empty(fixed_name)
        return
    endif

    let until_dot_prefix = s:get_fixed_dir(a:original_abs_path) . '/' . fixed_name
    let until_literal_prefix = substitute(until_dot_prefix, '\C/\zsdot_', '.', 'g')
    let b:chezmoi_target_path = substitute(until_literal_prefix, '\C/\zsliteral_', '', 'g') " ~/.local/share/chezmoi/.zshrc
    let b:final_target_path = substitute(b:chezmoi_target_path, '.local/share/chezmoi/', '', 'g') " ~/.zshrc

    return b:final_target_path
endfunction

function! s:get_fixed_name(original_name) abort
    if !exists('s:name_prefix_pattern')
        let s:name_prefix_pattern = s:get_name_prefix_pattern()
    endif

    return substitute(a:original_name, '\C\v^' . s:name_prefix_pattern . '|%(\.literal)?%(\.tmpl)?$', '', 'g')
endfunction

function! s:get_name_prefix_pattern()
    let prefix_list = [
                \ 'create',
                \ 'modify',
                \ 'remove',
                \ 'run',
                \ 'encrypted',
                \ 'private',
                \ 'readonly',
                \ 'executable',
                \ 'once',
                \ 'onchange',
                \ 'before',
                \ 'after',
                \ 'symlink',
                \ 'empty'
                \ ]
    return join(map(prefix_list, '"%(" . v:val . "_)?"'), '')
endfunction

function! s:get_fixed_dir(original_abs_path) abort
    return substitute(fnamemodify(a:original_abs_path, ':h'), '\C\v/\zs%(exact_)?%(private_)?%(readonly_)?\ze%(literal_)?', '', 'g')
endfunction

" Swap between target path and source path
function! hl#chezmoi#swap_between_target_and_source()
    let current_path = expand('%:p')
    if current_path =~# '.local/share/chezmoi/' " current path is located in ~/.local/share/chezmoi/, now we are inside the source path
        let target_path = s:get_target_file(current_path)
        exec 'edit ' . target_path
    else " now we are in the target path, so we should check this file have corresponding source file or not
        let target_path = system('chezmoi source-path ' . current_path)
        if v:shell_error != 0
            echoerr 'Current file is not managed by chezmoi!!!'
        else
            exec 'edit ' . target_path
        endif
    endif
endfunction
