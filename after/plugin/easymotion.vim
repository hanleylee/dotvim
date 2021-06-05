if !PlugLoaded('vim-easymotion')
    finish
endif

nmap <Leader><Space>          <Plug>(easymotion-bd-w)
vmap <Leader><Space>          <Plug>(easymotion-bd-w)

let g:EasyMotion_smartcase = 1
