" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-rooter')
    finish
endif

let g:rooter_targets = '/,*'
let g:rooter_patterns = g:hl_rootmarkers
let g:rooter_change_directory_for_non_project_files = 'current' "change to the directory of current file
let g:rooter_manual_only = 0
let g:rooter_cd_cmd = 'lcd'
let g:rooter_silent_chdir = 1
