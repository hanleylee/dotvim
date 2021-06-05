if !PlugLoaded('vim-matchup')
    finish
endif

let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_hi_surround_always = 0
let g:matchup_matchparen_deferred_show_delay = 200
let g:matchup_matchparen_deferred_hide_delay = 1000

hi MatchWord     cterm=underline ctermbg=238                 guibg=#444444             gui=underline
hi MatchParenCur cterm=underline                                                       gui=underline
hi MatchWordCur  cterm=underline                                                       gui=underline
