" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" 使 preview 窗口滚动, 比如 coc.nvim 或者 vim-quickui
function! hl#ui#preview_scroll(direction)
    if a:direction ==# 'u'
        let scroll_lines = -20
        let scroll_direction = 0
    elseif a:direction ==# 'd'
        let scroll_lines = 20
        let scroll_direction = 1
    elseif a:direction ==# 'k'
        let scroll_lines = -1
        let scroll_direction = 0
    elseif a:direction ==# 'j'
        let scroll_lines = 1
        let scroll_direction = 1
    endif
    " if a:direction ==# 'u'
    if hl#plug_loaded('coc.nvim') && coc#float#has_scroll() 
        call coc#float#scroll(scroll_direction, abs(scroll_lines))
    elseif hl#plug_loaded('vim-quickui')
        call quickui#preview#scroll(scroll_lines)
    endif
    " elseif a:direction ==# 'd'
    "     if hl#plug_loaded('coc.nvim') && coc#float#has_scroll() 
    "         call coc#float#scroll(1, scroll_lines)
    "     elseif hl#plug_loaded('vim-quickui')
    "         call quickui#preview#scroll(scroll_lines)
    "     endif
    " endif
endfunction

" 0: up, 1: down, 2:pgup, 3:pgdown, 4: top, 5: bottom
function! hl#ui#previous_win_scroll(direction)
    let pre_win_nr = winnr('#')
    if pre_win_nr <= 0
        echoerr 'Previous window not found!'
        return
    endif
    let pre_win_id = win_getid(pre_win_nr)
    if a:direction == 'k'
        let cmd = "normal! \<c-y>"
    elseif a:direction == 'j'
        let cmd = "normal! \<c-e>"
    elseif a:direction == 'gg'
        let cmd = "normal! gg"
    elseif a:direction == 'G'
        let cmd = "normal! G"
    elseif a:direction =='u'
        let cmd = "normal! \<c-u>"
    elseif a:direction == 'd'
        let cmd = "normal! \<c-d>"
        " elseif a:direction == 2
        "     let cmd = "normal! " . winheight('.') . "\<c-y>"
        " elseif a:direction == 3
        "     let cmd = "normal! " . winheight('.') . "\<c-e>"
        " elseif a:direction == 8
        "     let cmd = "normal! k"
        " elseif a:direction == 9
        "     let cmd = "normal! j"
    endif
    call win_execute(pre_win_id, cmd)
endfunction

" show document{{{
function! hl#ui#show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
    else
        " call feedkeys('K', 'in')
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction
"}}}

" 切换显示行号/相对行号/不显示
function hl#ui#toggle_number()
    if &nu && &rnu
        set nonu nornu
    elseif &nu && !&rnu
        set rnu
    else
        set nu
    endif
endfunction

" close all window, specially for vim {{{
function! hl#ui#close_all() abort
    let term_bufs = filter(range(1, bufnr('$')), 'getbufvar(v:val, "&buftype") == "terminal"')
    for term_num in term_bufs
        execute "bd! " . term_num
    endfor
    xa
endfunction

function hl#ui#close_win(winnr)
    let winnum = bufwinnr(a:winnr)
    if winnum == -1
        return 0
    endif
    " Goto the workspace window, close it and then come back to the
    " original window
    let curbufnr = bufnr('%')
    exe winnum . 'wincmd w'
    close
    " Need to jump back to the original window only if we are not
    " already in that window
    let winnum = bufwinnr(curbufnr)
    if winnr() != winnum
        exe winnum . 'wincmd w'
    endif
    return 1
endfunction

" 删除所有未显示且无修改的缓冲区以减少内存占用
function hl#ui#clean_bufs()
    for bufNr in filter(range(1, bufnr('$')),
                \ 'buflisted(v:val) && !bufloaded(v:val)')
        execute bufNr . 'bdelete'
    endfor
endfunction

function! hl#ui#UpdateGuiFontSize(type)
    let l:current_font = &guifont
    let l:current_size = matchstr(l:current_font, ':h\zs\d\+')
    " 如果找不到字体大小, 设置默认值为16
    if l:current_size == ''
        let l:current_size = 16
    else
        let l:current_size = str2nr(l:current_size)
    endif

    let l:new_size = a:type == 'up' ? l:current_size + 1 : l:current_size - 1
    let l:new_font = substitute(l:current_font, ':h\d\+', ':h' . l:new_size, '')

    exec 'set guifont=' . fnameescape(l:new_font)
endfunction

function! hl#ui#UpdateGuiFontWideSize(type)
    let l:current_font = &guifontwide
    let l:current_size = matchstr(l:current_font, ':h\zs\d\+')
    " 如果找不到字体大小, 设置默认值为16
    if l:current_size == ''
        let l:current_size = 16
    else
        let l:current_size = str2nr(l:current_size)
    endif

    let l:new_size = a:type == 'up' ? l:current_size + 1 : l:current_size - 1
    let l:new_font = substitute(l:current_font, ':h\d\+', ':h' . l:new_size, '')

    echom l:new_font
    exec 'set guifontwide=' . fnameescape(l:new_font)
endfunction

function! hl#ui#UpdateFontSize(type)
    call hl#ui#UpdateGuiFontSize(a:type)
    call hl#ui#UpdateGuiFontWideSize(a:type)
endfunction

