" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('bracey.vim')
    finish
endif

" let g:bracey_browser_command = "open -a 'Google Chrome'"
let g:bracey_browser_command = "open -a 'Safari'"
let g:bracey_auto_start_browser = 1
let g:bracey_refresh_on_save = 0
let g:bracey_eval_on_save = 1
let g:bracey_auto_start_server = 1
let g:bracey_server_allow_remote_connections = 0
" let g:bracey_server_port
let g:bracey_server_path = 'http://127.0.0.1'
let g:bracey_server_log = '/tmp/bracey_server_logfile'
