" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

"███████████████████████   Appearance   ██████████████████████████

let s:colors = onedark#GetColors()

let s:red = s:colors.red
let s:dark_red = s:colors.dark_red
let s:green = s:colors.green
let s:yellow = s:colors.yellow
let s:dark_yellow = s:colors.dark_yellow
let s:blue = s:colors.blue
let s:purple = s:colors.purple
let s:cyan = s:colors.cyan
let s:white = s:colors.white
let s:black = s:colors.black
let s:visual_black = s:colors.visual_black " Black out selected text in 16-color visual mode
let s:comment_grey = s:colors.comment_grey
let s:gutter_fg_grey = s:colors.gutter_fg_grey
let s:cursor_grey = s:colors.cursor_grey
let s:visual_grey = s:colors.visual_grey
let s:menu_grey = s:colors.menu_grey
let s:special_grey = s:colors.special_grey
let s:vertsplit = s:colors.vertsplit
let s:orange = { "gui": "#FF8700", "cterm": "208", "cterm16": "11" }

let s:reverse = 'reverse' " reverse 会让主题色的优先级更高, 如果遇到颜色优先级问题, 可以尝试使用 reverse 解决(灵感来自 gruvbox)
let s:bold = 'bold'
let s:reverse_bold = 'reverse,bold'
let s:underline = 'underline'
let s:italic = 'italic'
let s:strikethrough = 'strikethrough'

function! OneDarkRevise()
    call onedark#set_highlight('pythonBuiltinFunc', {'fg': s:cyan})
    call onedark#set_highlight('Search', {'fg': s:yellow, 'bg': s:black, 'gui': s:reverse_bold, 'cterm': s:reverse_bold})
    call onedark#set_highlight('Todo', {'fg': s:orange, 'bg': s:black, 'gui': s:reverse_bold, 'cterm': s:reverse_bold})
    call onedark#set_highlight('Error', {'fg': s:red, 'bg': s:black, 'gui': s:reverse_bold, 'cterm': s:reverse_bold})
    call onedark#set_highlight('TaskPaperURL', {'fg': s:blue, 'gui': s:underline, 'cterm': s:underline})
    call onedark#set_highlight('TaskPaperDone', {'fg': s:comment_grey, 'gui': s:strikethrough, 'cterm': s:strikethrough})
    call onedark#set_highlight('TaskPaperCancelled', {'fg': s:comment_grey, 'gui': s:strikethrough, 'cterm': s:strikethrough})

    " highlight Todo                          ctermbg=208 ctermfg=black    gui=bold      guibg=#ff8700    guifg=black
    "}}}
endfunction
" @nihao: nihao

function! HLColorScheme()
    " highlight {{{
    highlight Cursor        cterm=bold      ctermbg=black ctermfg=white  gui=bold     guifg=black     guibg=white
    highlight Visual        cterm=reverse,bold   ctermbg=NONE  ctermfg=NONE   gui=reverse,bold  guifg=NONE      guibg=NONE
    highlight QuickFixLine  cterm=NONE      ctermbg=238 ctermfg=145      gui=bold     guibg=#4B5263   guifg=#ABB2BF
    " hi CursorLine ctermbg=black term=none cterm=none guifg=NONE guibg=NONE
    " highlight CursorLineNr guibg=green guifg=black
    " highlight LineNr ctermfg=grey ctermbg=white guibg=grey
    " highlight SignColumn ctermfg=grey ctermbg=white guibg=grey
    " highlight link QuickFixLine CursorLine
    " highlight ColorColumn ctermbg=green guibg=orange
    " highlight CursorLine    cterm=NONE      ctermbg=NONE ctermfg=NONE  guibg=#444444   guifg=black gui=bold
    " highlight CursorColumn  cterm=NONE      ctermbg=238 ctermfg=NONE  guibg=#444444   guifg=NONE
    " highlight PmenuSel      cterm=bold      ctermbg=green ctermfg=black guibg=#00ff00 guifg=black gui=bold
    " highlight Pmenu         cterm=bold      ctermbg=238   ctermfg=white guibg=#444444 guifg=white gui=bold
    " highlight Search         cterm=inverse  ctermbg=235  ctermfg=214  guibg=#282828    guifg=#fabd2f gui=inverse
    " ['hi', 'Search', 'guifg=#fabd2f', 'ctermfg=214', 'guibg=#282828', 'ctermbg=235', 'gui=inverse', 'cterm=inverse']
    " 
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
