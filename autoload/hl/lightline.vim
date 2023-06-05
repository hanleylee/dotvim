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
    let term_count = has('nvim') ? 0 : len(filter(range(1, bufnr('$')), 'getbufvar(v:val, "&buftype") == "terminal"'))
    let changed_buffer = len(filter(getbufinfo(), 'v:val.changed == 1')) - term_count
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

function! hl#lightline#FileNameWithIcon() abort
    if &filetype ==? 'fern' || &filetype ==? 'fugitive'
        return WebDevIconsGetFileTypeSymbol() . ' ' . resolve(expand('%')) "  ~/r/hkms/src/test.vim
    else
        if FindRootDirectory() == '' " when not inside a repo
            let git_dir = ''
            let root_path = hl#fs#getOnlyDirectory() " /Users/hanley/test_dir
            let modified_path = fnamemodify(root_path, ':~') " ~/test_dir
            let right_path = pathshorten(modified_path) " ~/t
        else " when inside a repo
            let root_path = FindRootDirectory() " /Users/hanley/repo/hkms
            let modified_path = fnamemodify(root_path, ':~') " ~/repo/hkms
            let git_dir = pathshorten(modified_path) " ~/r/hkms
            let full_path = hl#fs#getOnlyDirectory()
            " avoid error: no previous substitute regular expression
            " https://github.com/Shougo/deoplete.nvim/commit/dfe7e189b17f28d9b93bda6cc1a64f61fdf5e206
            let escaped_root_path = escape(root_path, '~\.^$[]*')
            let right_path = substitute(full_path, escaped_root_path, '', 'e') " src
        endif
        let res_path = git_dir . right_path " ~/r/hkms/src/test.vim
        let file_name = hl#fs#getOnlyFileName() == '' ? '' : '/' . hl#fs#getOnlyFileName()
        return WebDevIconsGetFileTypeSymbol() . ' ' . res_path . file_name "  ~/r/hkms/src/test.vim
    endif
endfunction

function! hl#lightline#TabIcon(n)
    let l:bufnr = tabpagebuflist(a:n)[tabpagewinnr(a:n) - 1]
    return WebDevIconsGetFileTypeSymbol(bufname(l:bufnr))
endfunction

function! hl#lightline#FiletypeWithIcon()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! hl#lightline#FileFormatWithIcon()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction
