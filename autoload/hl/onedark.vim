" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

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
let s:foreground = s:colors.foreground
let s:background = s:colors.background
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

function! hl#onedark#patch()
    call onedark#set_highlight('pythonBuiltinFunc', {'fg': s:cyan})
    call onedark#set_highlight('Search', {'fg': s:yellow, 'bg': s:black, 'gui': s:reverse_bold, 'cterm': s:reverse_bold})
    call onedark#set_highlight('Todo', {'fg': s:orange, 'gui': s:bold, 'cterm': s:bold})
    call onedark#set_highlight('Error', {'fg': s:red, 'bg': s:black, 'gui': s:reverse_bold, 'cterm': s:reverse_bold})
    call onedark#set_highlight('HLNote', {'fg': s:blue, 'gui': s:bold, 'cterm': s:bold})
    call onedark#set_highlight('HLWarning', {'fg': s:orange, 'gui': s:bold, 'cterm': s:bold})
    call onedark#set_highlight('HLError', {'fg': s:red, 'gui': s:bold, 'cterm': s:bold})

    " coc.nvim {{{
    if hl#plug_loaded('coc.nvim')
        call onedark#set_highlight('CocHighlightText', {'bg': s:vertsplit, 'gui': s:bold, 'cterm': s:bold})
        call onedark#set_highlight('HighlightedyankRegion', {'fg': s:black, 'bg': s:green, 'gui': s:bold, 'cterm': s:bold})
        call onedark#set_highlight('CocFloating', {'fg': s:white, 'bg': s:visual_grey})
        call onedark#set_highlight('CocMenuSel', {'fg': s:black, 'bg': s:blue, 'gui': s:bold, 'cterm': s:bold})
        call onedark#set_highlight('CocPumSearch', {'fg': s:green})
        call onedark#set_highlight('CocListLine', {'bg': s:background, 'gui': s:bold, 'cterm': s:bold})
        call onedark#set_highlight('CocListSearch', {'fg': s:green})
        call onedark#set_highlight('CocInlayHint', {'fg': s:comment_grey, 'gui': s:italic, 'cterm': s:italic})
    endif
    "}}}

    " highlight Todo                          ctermbg=208 ctermfg=black    gui=bold      guibg=#ff8700    guifg=black
endfunction
