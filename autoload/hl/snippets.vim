" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" make snippets surrounded by 'hl_'
function! hl#snippets#make_hl(mode)
    call hl#operate#embedded_with_string_2(a:mode, 'hl_', '_hl')
endfunction

