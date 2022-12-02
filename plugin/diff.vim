" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

setlocal norelativenumber
setlocal colorcolumn=

nnoremap <buffer>dgl   :diffget LOCAL<CR>
xnoremap <buffer>dgl   :diffget LOCAL<CR>

nnoremap <buffer>dgb   :diffget BASE<CR>
xnoremap <buffer>dgb   :diffget BASE<CR>

nnoremap <buffer>dgr   :diffget REMOTE<CR>
xnoremap <buffer>dgr   :diffget REMOTE<CR>

nnoremap <buffer>adgl  :%diffget LOCAL<CR>
nnoremap <buffer>adgb  :%diffget BASE<CR>
nnoremap <buffer>adgr  :%diffget REMOTE<CR>
