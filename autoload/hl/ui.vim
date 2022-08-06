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

" show document{{{
function! hl#ui#show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
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

" 将当前窗口置于屏幕中间(全屏时用)
function hl#ui#center_full()
  on
  vs
  ene
  setl nocul
  setl nonu
  40winc |
  winc l
  vs
  winc l
  ene
  setl nocul
  setl nonu
  40winc |
  winc h
  redr!
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

