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
    highlight Cursor        cterm=bold      ctermbg=black ctermfg=white guifg=black   guibg=white gui=bold
    highlight Visual        cterm=reverse   ctermbg=NONE  ctermfg=NONE guifg=NONE   guibg=NONE gui=reverse
    highlight QuickFixLine  cterm=NONE      ctermbg=238 ctermfg=145  guibg=#4B5263   guifg=#ABB2BF gui=bold
    " highlight CursorLineNr guibg=green guifg=black
    " highlight LineNr ctermfg=grey ctermbg=white guibg=grey
    " highlight SignColumn ctermfg=grey ctermbg=white guibg=grey
    " highlight link QuickFixLine CursorLine
    " highlight ColorColumn ctermbg=green guibg=orange
    " highlight CursorLine    cterm=NONE      ctermbg=NONE ctermfg=NONE  guibg=#444444   guifg=NONE gui=bold
    " highlight CursorColumn  cterm=NONE      ctermbg=238 ctermfg=NONE  guibg=#444444   guifg=NONE
    " highlight PmenuSel      cterm=bold      ctermbg=green ctermfg=black guibg=#00ff00 guifg=black gui=bold
    " highlight Pmenu         cterm=bold      ctermbg=238   ctermfg=white guibg=#444444 guifg=white gui=bold
    " highlight Search        cterm=NONE      ctermbg=blue  ctermfg=grey  guibg=blue    guifg=grey 
    highlight Todo                          ctermbg=208 ctermfg=black guibg=#ff8700    guifg=black  gui=bold
    highlight MatchParen    cterm=italic    ctermbg=black ctermfg=178   guibg=#d7af00 guifg=black gui=italic
    "}}}

    if PlugLoaded('vim-sneak')
        highlight Sneak      guifg=black guibg=#E5C078    ctermfg=black ctermbg=yellow
        highlight SneakScope guifg=red   guibg=green ctermfg=red   ctermbg=green
    endif

    " vim-quickui {{{
    if PlugLoaded('vim-quickui')
        highlight! QuickBG ctermfg=0 ctermbg=7 guifg=black guibg=gray
        highlight! QuickSel cterm=bold ctermfg=0 ctermbg=2 gui=bold guibg=brown guifg=gray
        highlight! QuickKey term=bold ctermfg=9 gui=bold guifg=#f92772
        highlight! QuickOff ctermfg=59 guifg=#75715e
        highlight! QuickHelp ctermfg=247 guifg=#959173
    endif
    "}}}

    " vim-floaterm {{{
    if PlugLoaded('vim-floaterm')
        hi Floaterm                       ctermbg=black           guibg=#282C34
        hi FloatermBorder cterm=bold      ctermbg=170 ctermfg=235 guibg=#C678DD guifg=#282C34 gui=bold
        if has('nvim')
            hi FloatermNC guibg=gray
        endif
    endif
    "}}}

    " coc.nvim {{{
    if PlugLoaded('coc.nvim')
        highlight CocHighlightText cterm=bold ctermbg=238 ctermfg=NONE  guibg=#444444 guifg=NONE gui=bold
    endif
    "}}}

    " vim-matchup {{{
    if PlugLoaded('vim-matchup')
        highlight MatchWord     cterm=underline ctermbg=238                 guibg=#444444             gui=underline
        highlight MatchParenCur cterm=underline                                                       gui=underline
        highlight MatchWordCur  cterm=underline                                                       gui=underline
    endif
    "}}}

    " echodoc {{{
    if PlugLoaded('echodoc.vim')
        highlight link EchoDocPopup Pmenu
    endif
    "}}}

    " vim-gitgutter {{{
    if PlugLoaded('vim-gitgutter')
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
if PlugLoaded('onedark.vim')
    colorscheme onedark
endif
"}}}

" gruvbox {{{
if PlugLoaded('gruvbox')
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
