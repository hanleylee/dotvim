" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-dadbod-ui')
    finish
endif

let g:db_ui_save_location = '~/.config/dadbob-ui'
let g:dbs = {
            \ 'MongoDB': 'mongodb://127.0.0.1:27017',
            \ 'MySQL': 'mysql://root@localhost:3036',
            \ }

let g:db_ui_auto_execute_table_helpers = 0
" let g:db_ui_icons = {
"             \ 'expanded': '▾',
"             \ 'collapsed': '▸',
"             \ 'saved_query': '*',
"             \ 'new_query': '+',
"             \ 'tables': '~',
"             \ 'buffers': '»',
"             \ 'connection_ok': '✓',
"             \ 'connection_error': '✕',
"             \ }
let g:db_ui_show_help = 0
let g:db_ui_winwidth = 50
let g:db_ui_disable_mappings = 0
let g:db_ui_force_echo_notifications=1
