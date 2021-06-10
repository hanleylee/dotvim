if !PlugLoaded('vim-alternate')
    finish
endif

let g:extraAlternativeExtensionsDic = {
            \ 'm': 'h',
            \ 'h': 'm'
            \ } 
let g:overrideAlternativeExtensionsDic = {}
