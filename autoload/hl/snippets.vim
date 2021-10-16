" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" make snippets surrounded by 'hl_'
function! hl#snippets#make_hl(mode)
    call hl#embedded_with_string(a:mode, 'hl_', '_hl')
endfunction

