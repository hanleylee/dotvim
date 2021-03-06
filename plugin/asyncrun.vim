" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('asyncrun.vim')
    finish
endif

let g:asyncrun_exit = "silent call system('afplay ~/.vim/crystal.aiff &')"
let g:asyncrun_mode = 0 " This option indicates how to start the job.
let g:asyncrun_wrapper = '' " This can be used to setup a command prefix.
let g:asyncrun_rootmarks = g:hl_rootmarkers
let g:asyncrun_open = 10 " 自动打开 quickfix window, 高度为 10
let g:asyncrun_bell = 1  " 任务结束时候响铃提醒
let g:asyncrun_encs = '' " Job stdout/stderr encoding
let g:asyncrun_trim='' " non-zero to trim the empty lines in the quickfix window.
let g:asyncrun_auto='' " event name to trigger QuickFixCmdPre/QuickFixCmdPost
" let g:asyncrun_save=2
let g:asyncrun_timer=50 " how many messages should be inserted into quickfix every 100ms interval
let g:asyncrun_local=0 " Set to 1 to use local errorformat, standard output/error of child process will be matched by local errorformat if g:asyncrun_local is set to 1
let g:asyncrun_shell='' " Specify shell executable.
let g:asyncrun_shellflag='' " Specify shell flags. by default, AsyncRun will use vim's shellcmdflag option to config shell flags, it can be overrided without changing your &shellcmdflag
