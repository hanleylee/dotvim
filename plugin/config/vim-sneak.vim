" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('vim-sneak')
    finish
endif

let g:sneak#label = 1

let g:sneak#f_reset = 1
let g:sneak#t_reset = 1
let g:sneak#s_next = 1
let g:sneak#absolute_dir = 0
let g:sneak#use_ic_scs = 0
let g:sneak#map_netrw = 1
let g:sneak#label_esc = "\<Space>"
let g:sneak#target_labels = ';sftunq/SFGHLTUNRMQZ?0'
let g:sneak#prompt = '>'

map f <Plug>Sneak_s
map F <Plug>Sneak_S
xmap f <Plug>Sneak_s
xmap F <Plug>Sneak_S
omap z <Plug>Sneak_s
omap Z <Plug>Sneak_S
