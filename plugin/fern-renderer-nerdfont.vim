" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('fern-renderer-nerdfont.vim')
    finish
endif
let g:fern#renderer#nerdfont#padding = '  '
let g:fern#renderer = 'nerdfont'
