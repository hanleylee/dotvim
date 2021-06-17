" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

if !PlugLoaded('vim-togglecursor')
    finish
endif

let g:togglecursor_replace = 'underline'
let g:togglecursor_insert = 'line'
let g:togglecursor_default = 'block'
