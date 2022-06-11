" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-table-mode')
    finish
endif

let g:table_mode_corner='|' "设置转角处为 `|`, 如果设为其他比如`+`, Markdown 语法不支持

" let g:table_mode_motion_up_map = '{<Bar>'
" let g:table_mode_motion_down_map = '}<Bar>'
" let g:table_mode_motion_left_map = '[<Bar>'
" let g:table_mode_motion_right_map = ']<Bar>'
" let g:table_mode_cell_text_object_a_map = 'a<Bar>'
" let g:table_mode_cell_text_object_i_map = 'i<Bar>'
" let g:table_mode_realign_map = '<Leader>tr'
" let g:table_mode_delete_row_map = '<Leader>tdd'
" let g:table_mode_delete_column_map = '<Leader>tdc'
" let g:table_mode_insert_column_before_map = '<Leader>tiC'
" let g:table_mode_insert_column_after_map = '<Leader>tic'
" let g:table_mode_add_formula_map = '<Leader>tfa'
" let g:table_mode_eval_formula_map = '<Leader>tfe'
" let g:table_mode_echo_cell_map = '<Leader>t?'
" let g:table_mode_sort_map = '<Leader>ts'
" let g:table_mode_tableize_map = '<Leader>tt'
