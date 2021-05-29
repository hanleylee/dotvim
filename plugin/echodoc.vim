if !PlugLoaded('echodoc.vim')
    finish
endif

let g:echodoc_enable_at_startup = 1
let g:echodoc#type = 'popup'
highlight link EchoDocPopup Pmenu

