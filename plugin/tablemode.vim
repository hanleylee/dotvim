" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-table-mode')
    finish
endif

let g:table_mode_corner='|' "设置转角处为 `|`, 如果设为其他比如`+`, Markdown 语法不支持

