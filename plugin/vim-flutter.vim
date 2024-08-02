" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-flutter')
    finish
endif

let g:flutter_command = 'flutter'
let g:flutter_hot_reload_on_save = 1
let g:flutter_hot_restart_on_save = 0
let g:flutter_show_log_on_run = 'split'
let g:flutter_show_log_on_attach = 'split'
let g:flutter_autoscroll = 1
" g:flutter_use_last_run_option - When set to 1 then :FlutterRun will use the arguments from the previous call when no arguments are specified.
" g:flutter_use_last_attach_option - Identical to g:flutter_use_last_run_option but affecting the :FlutterAttach command.
let g:flutter_close_on_quit = 1
