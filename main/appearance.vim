"███████████████████████   Appearance   ██████████████████████████
if PlugLoaded('onedark.vim')
    colorscheme onedark
endif

" colorscheme gruvbox
set background=dark "设置背" seoul256 (dark):

hi Cursor        cterm=bold      ctermbg=black ctermfg=white guifg=black   guibg=white gui=bold
" hi CursorLine    cterm=NONE      ctermbg=NONE ctermfg=NONE  guibg=#4e4e4e   guifg=NONE gui=bold
" hi CursorColumn  cterm=NONE      ctermbg=238 ctermfg=NONE  guibg=#444444   guifg=NONE
" hi PmenuSel      cterm=bold      ctermbg=green ctermfg=black guibg=#00ff00 guifg=black gui=bold
" hi Pmenu         cterm=bold      ctermbg=238   ctermfg=white guibg=#444444 guifg=white gui=bold
" hi Search        cterm=NONE      ctermbg=blue  ctermfg=grey  guibg=blue    guifg=grey 
hi Todo                          ctermbg=208 ctermfg=black guibg=#ff8700    guifg=black  gui=bold
hi MatchParen    cterm=italic    ctermbg=black ctermfg=178   guibg=#d7af00 guifg=black gui=italic
