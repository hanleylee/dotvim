" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-dadbod-ui')
    finish
endif

let g:db_ui_save_location = expand('$HL_REPO/database/db_ui_queries')
let g:dbs = [            
            \ {'name': 'MongoDB', 'url': 'mongodb://127.0.0.1:27017'},
            \ {'name': 'MySQL', 'url': 'mysql://root@localhost:3306'},
            \ ]

let g:db_ui_table_helpers = {
            \   'postgresql': {
            \     'List': 'SELECT * FROM "{table}" ORDER BY id ASC;'
            \   },
            \   'mysql': {
            \     'List': 'SELECT * FROM {table} LIMIT 200;'
            \   }
            \ }
let g:db_ui_auto_execute_table_helpers = 1

let g:db_ui_icons = {
            \ 'expanded': '▾',
            \ 'collapsed': '▸',
            \ 'saved_query': '*',
            \ 'new_query': '+',
            \ 'tables': '~',
            \ 'buffers': '»',
            \ 'connection_ok': '✓',
            \ 'connection_error': '✕',
            \ }
let g:db_ui_show_help = 0
let g:db_ui_winwidth = 50
let g:db_ui_disable_mappings = 0
" let g:db_ui_disable_mappings_dbui = 1  " Disable mappings in DBUI drawer
" let g:db_ui_disable_mappings_dbout = 1 " Disable mappings in DB output
let g:db_ui_disable_mappings_sql = 0   " Disable mappings in SQL buffers
" let g:db_ui_disable_mappings_javascript = 1   " Disable mappings in Javascript buffers (for Mongodb)
let g:db_ui_force_echo_notifications=1
let g:db_ui_disable_progress_bar = 0
