" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-togglecursor')
    finish
endif

if exists('$TMUX')
    let g:togglecursor_force = 'xterm'
endif
" let g:togglecursor_enable_tmux_escaping = 1
let g:use_togglecursor_instead_of_native_in_cli = 1
let g:togglecursor_replace = 'underline'
let g:togglecursor_insert = 'line'
let g:togglecursor_default = 'block'
