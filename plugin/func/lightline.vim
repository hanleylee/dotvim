" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

if !PlugLoaded('lightline.vim')
    finish
endif

function! UpdateDiffHunks()
    setlocal nocursorbind
    setlocal noscrollbind
    let winview = winsaveview() 
    let pos = getpos(".")
    sil exe 'normal! gg'
    let moved = 1
    let hunks = []
    while moved
        let startl = line(".")
        keepjumps sil exe 'normal! ]c'
        let moved = line(".") - startl
        if moved
            call add(hunks,line("."))
        endif
    endwhile
    call winrestview(winview)
    call setpos(".",pos)
    setlocal cursorbind
    setlocal scrollbind
    let g:diff_hunks = hunks
endfunction

function! DiffCount()
    if !exists("g:diff_hunks") 
        call UpdateDiffHunks()
    endif
    let n_hunks = 0
    let curline = line(".")
    for hunkline in g:diff_hunks
        if curline < hunkline
            break
        endif
        let n_hunks += 1
    endfor
    let diffCount = len(g:diff_hunks)
    return diffCount == 0 ? '' : n_hunks . '/' . len(g:diff_hunks)
endfunction

