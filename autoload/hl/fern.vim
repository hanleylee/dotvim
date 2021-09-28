" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" make cursor line highlight when in fern appearance
function! hl#fern#highlight_cusorline()
    " highlight CursorLine    cterm=bold      ctermbg=170     ctermfg=235     gui=bold guibg=#C678DD guifg=#282C34
    highlight CursorLine    cterm=reverse,bold      ctermbg=NONE     ctermfg=NONE     gui=reverse,bold guibg=NONE guifg=NONE
endfunction

" put cursor line color back
function! hl#fern#put_back_cusorline()
    highlight CursorLine    cterm=NONE      ctermbg=236     ctermfg=NONE     gui=NONE guibg=#2C323C guifg=NONE
endfunction
