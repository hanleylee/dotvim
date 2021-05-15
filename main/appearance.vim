"███████████████████████   Appearance   ██████████████████████████
colorscheme onedark
" colorscheme gruvbox
set background=dark "设置背" seoul256 (dark):
" 外观插件会对外观进行设置, 如果在外观插件之前进行设置就会被覆写, 因此要放在配置文件末尾.
hi CursorLine    cterm=NONE      ctermbg=black ctermfg=NONE  guibg=black   guifg=NONE
hi CursorColumn  cterm=NONE      ctermbg=black ctermfg=NONE  guibg=black   guifg=NONE
hi Cursor        cterm=NONE      ctermbg=black ctermfg=white guifg=black   guibg=white gui=bold
hi PmenuSel      cterm=NONE      ctermbg=green ctermfg=black guibg=#00ff00 guifg=black
hi Pmenu         cterm=NONE      ctermbg=238   ctermfg=white guibg=#444444 guifg=white
" hi Search        cterm=NONE      ctermbg=blue  ctermfg=grey  guibg=blue    guifg=grey 
hi MatchParen    cterm=italic    ctermbg=black ctermfg=178   guibg=#d7af00 guifg=black gui=italic
hi MatchWord     cterm=underline ctermbg=238                 guibg=#444444             gui=underline
hi MatchParenCur cterm=underline                                                       gui=underline
hi MatchWordCur  cterm=underline                                                       gui=underline

" change cursor shape in different modes
" refer to https://vim.fandom.com/wiki/Change_cursor_shape_in_different_modes
" for Terminal on macOS
" let &t_SI.="\e[5 q" "SI = INSERT mode
" let &t_SR.="\e[4 q" "SR = REPLACE mode
" let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

" if exists('$TMUX')
"     " for iTerm2 or tmux running in iTerm2
"     let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
"     let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
"     let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
" else
"     " for iTerm2
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"     let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif
