" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('limelight.vim')
    finish
endif

"let g:limelight_default_coefficient = 0.5 "设置隐藏区域的黑暗度, 值越大越暗
"let g:limelight_paragraph_span = 2 "设置暗光的跨度, 暗光所能照亮的范围
"let g:limelight_priority = -1 "暗光优先级, 防止搜索的高亮效果被覆盖
"autocmd! User GoyoEnter Limelight "进入 Goyo 专注插件时, 同时开启暗光效果
"autocmd! User GoyoLeave Limelight! "离开 Goyo 专注插件时, 同时退出暗光效果
