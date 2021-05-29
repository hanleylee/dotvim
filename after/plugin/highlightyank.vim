if !PlugLoaded('vim-highlightedyank')
    finish
endif

let g:highlightedyank_highlight_duration = 1000 " 500 毫秒后高亮消失, -1 为不消失
