setlocal expandtab

vmap <buffer> <Leader>hl :<c-u>call hl#SnippetsEmbedded(visualmode())<cr>
nmap <buffer> <Leader>hl :set operatorfunc=hl#SnippetsEmbedded<cr>g@
