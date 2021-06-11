" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

if !PlugLoaded('vim-table-mode')
    finish
endif

let g:table_mode_corner='|' "设置转角处为 `|`, 如果设为其他比如`+`, Markdown 语法不支持

