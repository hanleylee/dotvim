" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" update diff hunks{{{
function! s:UpdateDiffHunks()
    setlocal nocursorbind
    setlocal noscrollbind
    let winview = winsaveview() 
    let pos = getpos(".")
    silent execute 'normal! gg'
    let moved = 1
    let hunks = []
    while moved
        let startl = line(".")
        keepjumps silent execute 'normal! ]c'
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
"}}}

" diff count{{{
function! hl#lightline#GitDiffCount()
    if !exists("g:diff_hunks") 
        call s:UpdateDiffHunks()
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
"}}}

function! hl#lightline#LightlineMode()
    return expand('%:t') =~# '^__Tagbar__' ? 'Tagbar':
                \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
                \ &filetype ==# 'unite' ? 'Unite' :
                \ &filetype ==# 'vimfiler' ? 'VimFiler' :
                \ &filetype ==# 'vimshell' ? 'VimShell' :
                \ lightline#mode()
endfunction

function! hl#lightline#LightlineFugitive()
    if exists('*FugitiveHead')
        let branch = FugitiveHead()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

" function! AleLinterStatus() abort
"     let l:counts = ale#statusline#Count(bufnr(''))
"     let l:all_errors = l:counts.error + l:counts.style_error
"     let l:all_non_errors = l:counts.total - l:all_errors
"     return l:counts.total == 0 ? '' : printf('%d  %d ', all_non_errors, all_errors)
" endfunction

function! hl#lightline#CocDiagnosticStatus1() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, '' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, ' ' . info['warning'])
    endif
    let statusStr = len(msgs) == 0 ? ' ' : join(msgs, ' ')
    return statusStr . get(g:, 'coc_status', '')
endfunction

function! hl#lightline#LightlineReadonly()
    return &readonly ? '' : ''
endfunction

func! hl#lightline#BuffersCount()
    let changed_buffer = len(filter(getbufinfo(), 'v:val.changed == 1'))
    let all_buffer = len(getbufinfo({'buflisted':1}))
    return changed_buffer . '/' . all_buffer
endfunc

function! s:get_gutentags_status(mods) abort
    let l:msg = ''
    if index(a:mods, 'ctags') >= 0
        let l:msg .= '♨'
    endif
    if index(a:mods, 'cscope') >= 0
        let l:msg .= '♺'
    endif
    return l:msg
endfunction

