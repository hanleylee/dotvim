setlocal expandtab

vmap <buffer> <Leader>hl :<c-u>call hl#snippets#make_hl(visualmode())<cr>
nmap <buffer> <Leader>hl :set operatorfunc=hl#snippets#make_hl<cr>g@
