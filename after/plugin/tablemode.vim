if !PlugLoaded('vim-table-mode')
    finish
endif

let g:table_mode_corner='|' "设置转角处为 `|`, 如果设为其他比如`+`, Markdown 语法不支持

