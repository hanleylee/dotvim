" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('asynctasks.vim')
    finish
endif

let g:asynctasks_term_pos = 'quickfix' " 只有 output 为 terminal, 这里的 term_pos 才有用
let g:asynctasks_term_reuse = 1
let g:asynctasks_term_focus = 0
let g:asynctasks_term_rows = 10    " 设置纵向切割时，高度为 10
let g:asynctasks_term_cols = 80    " 设置横向切割时，宽度为 80
let g:asynctasks_rtp_config = 'tasks.ini'
let g:asynctasks_config_name = '.tasks'
let g:asynctasks_extra_config = [] " will load extra config after ~/.vim/tasks.ini
let g:asynctasks_term_hidden = 1
