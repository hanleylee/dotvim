" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

"███████████████████████   Appearance   ██████████████████████████

function! OneDarkRevise()
    call onedark#set_highlight('pythonBuiltinFunc', {'fg': onedark#GetColors()['cyan']})
    " call onedark#set_highlight('CursorLineNr', {'fg': onedark#GetColors()['white'], 'bg': onedark#GetColors()['cursor_grey']})
endfunction

function! HLColorScheme()
    " highlight {{{
    highlight Cursor        cterm=bold      ctermbg=black ctermfg=white  gui=bold     guifg=black     guibg=white
    highlight Visual        cterm=reverse,bold   ctermbg=NONE  ctermfg=NONE   gui=reverse,bold  guifg=NONE      guibg=NONE
    highlight QuickFixLine  cterm=NONE      ctermbg=238 ctermfg=145      gui=bold     guibg=#4B5263   guifg=#ABB2BF
    " highlight CursorLineNr guibg=green guifg=black
    " highlight LineNr ctermfg=grey ctermbg=white guibg=grey
    " highlight SignColumn ctermfg=grey ctermbg=white guibg=grey
    " highlight link QuickFixLine CursorLine
    " highlight ColorColumn ctermbg=green guibg=orange
    " highlight CursorLine    cterm=NONE      ctermbg=NONE ctermfg=NONE  guibg=#444444   guifg=black gui=bold
    " highlight CursorColumn  cterm=NONE      ctermbg=238 ctermfg=NONE  guibg=#444444   guifg=NONE
    " highlight PmenuSel      cterm=bold      ctermbg=green ctermfg=black guibg=#00ff00 guifg=black gui=bold
    " highlight Pmenu         cterm=bold      ctermbg=238   ctermfg=white guibg=#444444 guifg=white gui=bold
    " highlight Search        cterm=NONE      ctermbg=blue  ctermfg=grey  guibg=blue    guifg=grey
    highlight Todo                          ctermbg=208 ctermfg=black    gui=bold      guibg=#ff8700    guifg=black
    highlight MatchParen    cterm=italic    ctermbg=black ctermfg=178    gui=italic,bold    guibg=#d7af00    guifg=black
    "}}}

    if hl#plug_loaded('vim-sneak')
        highlight Sneak       ctermfg=black ctermbg=yellow  guifg=black guibg=#E5C078
        highlight SneakScope  ctermbg=green ctermfg=red     guifg=red   guibg=green
    endif

    " vim-quickui {{{
    if hl#plug_loaded('vim-quickui')
        " hi! QuickBG ctermfg=0 ctermbg=7 guifg=green guibg=red
        " hi! QuickSel cterm=bold ctermfg=0 ctermbg=2 gui=bold guibg=brown guifg=gray
        " hi! QuickKey term=bold ctermfg=9 gui=bold guifg=#f92772
        " hi! QuickOff ctermfg=59 guifg=#75715e
        " hi! QuickHelp ctermfg=247 guifg=#959173
        " call onedark#set_highlight('QuickBG', {'fg': onedark#GetColors()['comment_grey'], 'bg': onedark#GetColors()['visual_grey']})
        " call onedark#set_highlight('QuickSel', {'fg': onedark#GetColors()['black'], 'bg': onedark#GetColors()['comment_grey']})
        " call onedark#set_highlight('QuickKey', {'fg': onedark#GetColors()['green'], 'bg': onedark#GetColors()['comment_grey']})
        " call onedark#set_highlight('QuickOff', {'fg': onedark#GetColors()['red'], 'bg': onedark#GetColors()['comment_grey']})
        " call onedark#set_highlight('QuickHelp', {'fg': onedark#GetColors()['white'], 'bg': onedark#GetColors()['visual_grey']})
    endif
    "}}}

    " vim-floaterm {{{
    if hl#plug_loaded('vim-floaterm')
        hi Floaterm                       ctermbg=black                     guibg=#282C34
        hi FloatermBorder cterm=bold      ctermbg=170 ctermfg=235  gui=bold guibg=#C678DD guifg=#282C34
        if has('nvim')
            hi FloatermNC guibg=gray
        endif
    endif
    "}}}

    " coc.nvim {{{
    if hl#plug_loaded('coc.nvim')
        highlight CocHighlightText cterm=bold ctermbg=238 ctermfg=NONE gui=bold guibg=#444444 guifg=NONE
    endif
    "}}}

    " vim-matchup {{{
    if hl#plug_loaded('vim-matchup')
        highlight MatchWord     cterm=bold,underline ctermbg=238    gui=bold,underline   guibg=#444444
        highlight MatchParenCur cterm=bold,underline                gui=bold,underline
        highlight MatchWordCur  cterm=bold,underline                gui=bold,underline
    endif
    "}}}

    " echodoc {{{
    if hl#plug_loaded('echodoc.vim')
        highlight link EchoDocPopup Pmenu
    endif
    "}}}

    " vim-gitgutter {{{
    if hl#plug_loaded('vim-gitgutter')
        " highlight SignColumn ctermbg=whatever    " terminal Vim
        " highlight SignColumn guibg=whatever      " gVim/MacVim
        " highlight GitGutterAdd    guifg=#009900 guibg=#FFFFFF ctermfg=2 ctermbg=3
        " highlight GitGutterChange guifg=#bbbb00 guibg=<X> ctermfg=3 ctermbg=<Y>
        " highlight GitGutterDelete guifg=#ff2222 guibg=<X> ctermfg=1 ctermbg=<Y>
        " highlight GitGutterAdd    guifg=#8dff1b ctermfg=10
        " highlight GitGutterChange guifg=#ffef00 ctermfg=13
        " highlight GitGutterDelete guifg=#e03131 ctermfg=1
        " highlight GitGutterChangeDelete guifg=#e03131 ctermfg=1
    endif
    "}}}
endfunction

set background=dark

" onedark {{{
if hl#plug_loaded('onedark.vim')
    colorscheme onedark
endif
"}}}

" gruvbox {{{
if hl#plug_loaded('gruvbox')
    colorscheme gruvbox
endif
"}}}

" MARK: On the latest versions of Vim and Neovim, fzf will start in a terminal buffer. If you find the default ANSI colors to be different, consider
" configuring the colors using g:terminal_ansi_colors in regular Vim or g:terminal_color_x in Neovim.

" if has('nvim')
"   let g:terminal_color_0 = '#4e4e4e'
"   let g:terminal_color_1 = '#d68787'
"   let g:terminal_color_2 = '#5f865f'
"   let g:terminal_color_3 = '#d8af5f'
"   let g:terminal_color_4 = '#85add4'
"   let g:terminal_color_5 = '#d7afaf'
"   let g:terminal_color_6 = '#87afaf'
"   let g:terminal_color_7 = '#d0d0d0'
"   let g:terminal_color_8 = '#626262'
"   let g:terminal_color_9 = '#d75f87'
"   let g:terminal_color_10 = '#87af87'
"   let g:terminal_color_11 = '#ffd787'
"   let g:terminal_color_12 = '#add4fb'
"   let g:terminal_color_13 = '#ffafaf'
"   let g:terminal_color_14 = '#87d7d7'
"   let g:terminal_color_15 = '#e4e4e4'
" else
"   let g:terminal_ansi_colors = [
"     \ '#4e4e4e', '#d68787', '#5f865f', '#d8af5f',
"     \ '#85add4', '#d7afaf', '#87afaf', '#d0d0d0',
"     \ '#626262', '#d75f87', '#87af87', '#ffd787',
"     \ '#add4fb', '#ffafaf', '#87d7d7', '#e4e4e4'
"   \ ]
" endif
