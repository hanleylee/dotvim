" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-easymotion')
    finish
endif

" turn on case insensitive feature
let g:EasyMotion_smartcase = 1
" keep cursor column when JK motion
let g:EasyMotion_startofline = 0

" let g:EasyMotion_keys = 'abcdefghijkImnoparstuvwy'
