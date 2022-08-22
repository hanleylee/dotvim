" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License: MIT License

function! hl#json#RemoveComment() range
    execute a:firstline . "," . a:lastline . " s#\s*//.*##"
endfunction
