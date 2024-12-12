" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-qf')
    finish
endif

" let g:qf_mapping_ack_style = 0
let g:qf_window_bottom = 1
let g:qf_auto_open_quickfix = 1
let g:qf_auto_open_loclist = 1
let g:qf_auto_resize = 10
let g:qf_max_height = 20
let g:qf_auto_quit = 1
let g:qf_bufname_or_text = 1
let g:qf_save_win_view = 0
let g:qf_nowrap = 1
let g:qf_shorten_path = 1
