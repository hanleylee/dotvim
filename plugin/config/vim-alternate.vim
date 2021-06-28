" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

if !PlugLoaded('vim-alternate')
    finish
endif

let g:extraAlternativeExtensionsDic = {
            \ 'm': 'h'
            \ } 
let g:overrideAlternativeExtensionsDic = {
            \ 'h': 'm,c,cpp,cxx,cc,CC'
            \ }
