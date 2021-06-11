" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

if !PlugLoaded('vim-alternate')
    finish
endif

let g:extraAlternativeExtensionsDic = {
            \ 'm': 'h',
            \ 'h': 'm'
            \ } 
let g:overrideAlternativeExtensionsDic = {}
