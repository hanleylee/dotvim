" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-auto-popmenu')
    finish
endif

let g:apc_enable_ft = {'*': 1}
" let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}
let g:apc_cr_confirm = 1 " type <CR> to use the current keyword
" source for dictionary, current or other loaded buffers, see ':help cpt'
set complete=.,k,w,b
" don't select the first item.
set completeopt=menu,menuone,noselect
" suppress annoy messages.
set shortmess+=c
