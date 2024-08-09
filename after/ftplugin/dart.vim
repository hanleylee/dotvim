" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

setlocal shiftwidth=2

function! s:IsFlutterProject()
    " Get the directory of the current file
    let l:dir = expand('%:p:h')

    " Loop to check each directory upwards
    while l:dir !=# '/'
        let file_path_to_check = l:dir . '/pubspec.yaml'
        " Check if pubspec.yaml exists in the current directory
        if filereadable(file_path_to_check)
            let l:lines = readfile(file_path_to_check)
            let l:content = join(l:lines, "\n")
            let l:flutter_sdk_pattern = 'sdk:\s\+flutter'

            " Search for the pattern in the content
            if l:content =~ l:flutter_sdk_pattern
                return 1
            endif
        endif

        " Move to the parent directory
        let l:dir = fnamemodify(l:dir, ':h')
    endwhile

    " Return 0 if no pubspec.yaml is found
    return 0
endfunction

if hl#plug_loaded('vim-flutter') && s:IsFlutterProject()
    " Some of these key choices were arbitrary;
    " it's just an example.
    nnoremap <buffer> <leader>Fs :FlutterRun<cr>
    nnoremap <buffer> <leader>Fa :FlutterAttach<cr>
    nnoremap <buffer> <leader>Fr :FlutterHotReload<cr>
    nnoremap <buffer> <leader>FR :FlutterHotRestart<cr>
    nnoremap <buffer> <leader>FD :FlutterVisualDebug<cr>
    nnoremap <buffer> <leader>Fq :FlutterQuit<cr>

    if g:is_in_macvim_gui
        " Enable Flutter menu
        call FlutterMenu()
        nnoremap <buffer> <silent><D-r> :FlutterHotReload<CR>
        nnoremap <buffer> <silent><D-R> :FlutterHotRestart<CR>
    endif

endif
