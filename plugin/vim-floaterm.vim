" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-floaterm')
    finish
endif

let g:floaterm_shell = &shell
let g:floaterm_title = 'floaterm: $1/$2'
let g:floaterm_wintype = 'float'
let g:floaterm_position = 'center'
let g:floaterm_width = 0.9
let g:floaterm_height = 0.8
let g:floaterm_borderchars = '─│─│┌┐┘└'
let g:floaterm_rootmarkers = g:hl_rootmarkers
let g:floaterm_opener = 'tabe'
let g:floaterm_autoclose = 0
let g:floaterm_autohide = 1
let g:floaterm_autoinsert = v:true
