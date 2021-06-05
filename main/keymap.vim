"███████████████████████   KeyMapping   ██████████████████████████
nnoremap <Backspace>         :noh<CR>
nnoremap <C-g>               :call EchoPath()<CR>
nnoremap <silent><F2>        :Run<CR>
nnoremap gdl                 :diffget LO<CR>
nnoremap gdr                 :diffget RE<CR>
nmap gx :silent execute "!open " . shellescape("<cWORD>")<CR>
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%' "%% 自动扩展为当前目录

