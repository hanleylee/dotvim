" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" 是否加载了 plug -> bool{{{
function! hl#plug_loaded(name)
    if !exists('g:plugs')
        return 0
    else
        return has_key(g:plugs, a:name)
    endif
endfunction
"}}}

function! hl#keep_mode_cursor_execute(cmd)
    let firstline = min([line('.'), line('v')])
    let lastline = max([line('.'), line('v')])
    let save_cursor = getcurpos()
    execute firstline . ',' . lastline . a:cmd
    call setpos('.', save_cursor)
endfunction

function! hl#grep_operator(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    silent execute "grep! " . shellescape(@@) . " ."
    copen
    let @@ = saved_unnamed_register
endfunction

" 异步执行任务
function! hl#async_task(mode)
    let full_pathname = hl#fs#getFullPathName()
    let repo_filename = FindRootDirectory()
    let just_filename = hl#fs#getOnlyFileName()
    if just_filename ==# 'Podfile'
        silent update | execute 'PodUpdate'
    elseif repo_filename =~# 'lib/main.dart'
        silent update | execute 'CocCommand flutter.run --no-sound-null-safety'
    elseif &filetype ==? 'vim'
        silent update | source %
    else
        silent update | execute 'AsyncTask ' . a:mode
    endif
endfunction

" 同步执行任务
function! hl#sync_task()
    silent w
    if &filetype ==? 'c'
        "exec 'AsyncRun gcc % -o build/%< && ./build/%<' "花了一晚上研究出来的可用方案
        "exec 'AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/build/$(VIM_FILENOEXT)" && ./build/"$(VIM_FILENOEXT)"'
        " !gcc `pkg-config --cflags --libs glib-2.0` -Wall -O2 % -o "$XDG_CACHE_HOME/build/c/"%< && "$XDG_CACHE_HOME/build/c/"%<
        let target = expand('$XDG_CACHE_HOME/build/c/') . expand('%:t:r')
        exec '!clang % -o ' . target . " && " . target
    elseif &filetype ==? 'cpp'
        let target = expand('$XDG_CACHE_HOME/build/cpp/') . expand('%:t:r')
        exec '!clang++ -std=c++17 % -o ' . target . " && " . target
    elseif &filetype ==? 'java'
        !javac %; time java %<
    elseif &filetype ==? 'sh'
        !time bash %
    elseif &filetype ==? 'swift'
        let target = expand('$XDG_CACHE_HOME/build/swift/') . expand('%:t:r')
        !swiftc -o "$HOME/.cache/build/swift/$(VIM_FILENOEXT)" "$(VIM_FILEPATH)" && "$HOME/.cache/build/swift/$(VIM_FILENOEXT)"
        exec '!swiftc % -o ' . target . " && " . target
    elseif &filetype ==? 'python'
        !time python3 %
    elseif &filetype ==? 'html'
        silent !open %
    elseif &filetype ==? 'xhtml'
        silent !open %
    elseif &filetype ==? 'go'
        !go build %<; time go run %
    else
        echoerr 'Current filetype is not supported!'
    endif

endfunction

function! hl#try_set_dictionary()
    let dict_path = "~/.vim/dict/" . &filetype . '.dict'
    if filereadable(expand(dict_path))
        execute 'setlocal dict+=' . dict_path
    endif
endfunction
"}}}

function s:TemplateContent(type)
    if g:is_win
        let templatePrefix = '$VIM/vimfiles/templates/template.'
    else
        let templatePrefix = '~/.vim/templates/template.'
    endif
    let fname = expand(templatePrefix . a:type)
    let content = readfile(fname)

    return content
endfunction

function hl#NewTemplate(filename)
    silent execute 'tabnew ' . a:filename
    call hl#LoadTemplate('!')
    setlocal nomodified
endfunction

function hl#LoadTemplate(bang)

    let content = s:TemplateContent(&ft)

    if a:bang == '!'  " clear all then load template contents
        1,$d " or %d
        call setline(1, content)
    else
        call append(line('.'), content)
    endif
endfunction

" 复制缓冲区到新标签页
function hl#copy_to_temp_tab()
    let temp_file = tempname()
    let alltext = getline(1, '$')

    execute 'tabnew ' . temp_file

    call setline('.', alltext)
endfunction

" Wrapper around man.vim's Man command
function! hl#Superman(...)
    if exists(":Man") != 2 " No :Man command defined
        source $VIMRUNTIME/ftplugin/man.vim
    endif

    " Build and pass off arguments to Man command
    execute 'Man' join(a:000, ' ')

    " Quit with error code if there is only one line in the buffer (i.e., manpage not found)
    if line('$') == 1 | cquit | endif

    let s:is_vman_from_term = get(g:, 'is_vman_from_term', '0')
    if s:is_vman_from_term
        silent only
    endif

    " Set options appropriate for viewing manpages
    " setlocal readonly
    setlocal nomodifiable
    setlocal noswapfile

    setlocal noexpandtab
    setlocal tabstop=4
    setlocal softtabstop=4
    setlocal shiftwidth=4
    setlocal nolist
    if exists('+colorcolumn')
        setlocal colorcolumn=0
    endif

    " To make us behave more like less
    noremap <buffer> q :q<CR>
endfunction

