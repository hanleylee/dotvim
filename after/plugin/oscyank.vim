if !PlugLoaded('vim-oscyank')
    finish
endif
let g:oscyank_max_length = 1000000
let g:oscyank_term = 'default'  " or 'screen', 'kitty', 'default'
let g:oscyank_silent = v:true  " or 1 for older versions of Vim
