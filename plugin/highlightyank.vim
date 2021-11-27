" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-highlightedyank')
    finish
endif

let g:highlightedyank_highlight_duration = 1000 " 500 毫秒后高亮消失, -1 为不消失
