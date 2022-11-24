" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" get path until directory
func! hl#fs#getOnlyDirectory()
    " if &filetype ==# 'netrw'
    "     return getcwd()
    " else
    return resolve(expand('%:p:h'))
    " endif
endfunc

" get only file name
func! hl#fs#getOnlyFileName()
    if &filetype ==# 'netrw'
        return ''
    else
        return resolve(expand('%:t'))
    endif
endfunc

" get full path
func! hl#fs#getFullPathName()
    return resolve(expand('%:p'))
endfunction

func! hl#fs#getDirs(dir)
    if empty(a:dir)
        let a:dir = hl#fs#getOnlyDirectory()
    endif
    let expanded_dir = expand(a:dir)
    let directories=glob(fnameescape(expanded_dir).'/{,.}*/', 1, 1)
    call map(directories, 'fnamemodify(v:val, ":p:h")')
    return directories
endfunction
