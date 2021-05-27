"███████████████████████   Appearance   ██████████████████████████
colorscheme onedark
" colorscheme gruvbox
set background=dark "设置背" seoul256 (dark):

" MARK: System group
hi Cursor        cterm=bold      ctermbg=black ctermfg=white guifg=black   guibg=white gui=bold
" hi CursorLine    cterm=NONE      ctermbg=NONE ctermfg=NONE  guibg=#4e4e4e   guifg=NONE gui=bold
" hi CursorColumn  cterm=NONE      ctermbg=238 ctermfg=NONE  guibg=#444444   guifg=NONE
" hi PmenuSel      cterm=bold      ctermbg=green ctermfg=black guibg=#00ff00 guifg=black gui=bold
" hi Pmenu         cterm=bold      ctermbg=238   ctermfg=white guibg=#444444 guifg=white gui=bold
" hi Search        cterm=NONE      ctermbg=blue  ctermfg=grey  guibg=blue    guifg=grey 
hi Todo          cterm=NONE      ctermbg=208 ctermfg=black guibg=#ff8700    guifg=black  gui=bold 
hi MatchParen    cterm=italic    ctermbg=black ctermfg=178   guibg=#d7af00 guifg=black gui=italic

" MARK: Plugin group
" Coc
hi CocHighlightText cterm=bold ctermbg=238 ctermfg=NONE  guibg=#444444 guifg=NONE gui=bold

" vim-matchup
hi MatchWord     cterm=underline ctermbg=238                 guibg=#444444             gui=underline
hi MatchParenCur cterm=underline                                                       gui=underline
hi MatchWordCur  cterm=underline                                                       gui=underline

" vim-quickui
hi! QuickBG ctermfg=0 ctermbg=7 guifg=black guibg=gray
hi! QuickSel cterm=bold ctermfg=0 ctermbg=2 gui=bold guibg=brown guifg=gray
hi! QuickKey term=bold ctermfg=9 gui=bold guifg=#f92772
hi! QuickOff ctermfg=59 guifg=#75715e
hi! QuickHelp ctermfg=247 guifg=#959173
