" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('Colorizer')
    finish
endif

let g:colorizer_auto_color = 0

let g:colorizer_colornames_disable = 1
let g:colorizer_auto_filetype='css,html'
let g:colorizer_skip_comments = 1
let g:colorizer_colornames = 1
let g:colorizer_x11_names = 0
let g:colorizer_syntax = 0
let g:colorizer_fgcontrast = 1
" let g:colorizer_hex_pattern = ['#', '\%(\x\{3}\|\x\{6}\)', '']
" let g:colorizer_hex_pattern = ['rgb:', '\%(\x\x\/\x\x\/\x\x\)', '']
" let g:colorizer_custom_colors = { 'blue': '#ff0000'}
" let g:colorizer_disable_bufleave = 1
" let g:colorizer_<autocomand> = 0
" let g:colorizer_conceal_cursor_mode='nv'

let g:colorizer_auto_map = 1
" <Leader>cC      <Plug>Colorizer     Toggle highlighting of Colors. In visual mode it only highlights the colors in the selected region (normal and visual mode).
" <Leader>cT      <Plug>ColorContrast Cycle through contrast setting :ColorContrast (normal and visual mode)
" <Leader>cF      <Plug>ColorFgBg     Toggle foreground and background color :ColorSwapFgBg
