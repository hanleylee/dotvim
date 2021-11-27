" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-matchup')
    finish
endif

let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_hi_surround_always = 0
let g:matchup_matchparen_deferred_show_delay = 200
let g:matchup_matchparen_deferred_hide_delay = 1000

