" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

if !PlugLoaded('vim-matchup')
    finish
endif

let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_hi_surround_always = 0
let g:matchup_matchparen_deferred_show_delay = 200
let g:matchup_matchparen_deferred_hide_delay = 1000

