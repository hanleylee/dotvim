" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-togglecursor')
    finish
endif

let g:togglecursor_replace = 'underline'
let g:togglecursor_insert = 'line'
let g:togglecursor_default = 'block'
