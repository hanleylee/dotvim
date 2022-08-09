" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('eregex.vim')
    finish
endif

let g:eregex_default_enable = 0

let g:eregex_forward_delim = '/'
let g:eregex_backward_delim = '?'

let g:eregex_force_case = 0
