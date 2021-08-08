" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" source file, avoid long expression
func! Source(filename)
    exec 'source '.expand(a:filename)
endfunction

" guard directory exists, create it if not!
func! GuardExistDirectory(dir)
    if !isdirectory(a:dir)
        silent! call mkdir(a:dir, 'p')
    endif
endfunc

" 是否加载了 plug
function! PlugLoaded(name)
    return has_key(g:plugs, a:name)
endfunction

