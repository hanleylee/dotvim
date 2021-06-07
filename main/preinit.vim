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