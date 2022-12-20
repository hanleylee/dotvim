" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if &diff
    set norelativenumber
    set colorcolumn=

    nnoremap dgl   :diffget LOCAL<CR>
    xnoremap dgl   :diffget LOCAL<CR>

    nnoremap dgb   :diffget BASE<CR>
    xnoremap dgb   :diffget BASE<CR>

    nnoremap dgr   :diffget REMOTE<CR>
    xnoremap dgr   :diffget REMOTE<CR>

    nnoremap adgl  :%diffget LOCAL<CR>
    nnoremap adgb  :%diffget BASE<CR>
    nnoremap adgr  :%diffget REMOTE<CR>
endif
