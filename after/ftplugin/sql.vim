" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if hl#plug_loaded('vim-dadbod-ui')
    nmap <buffer> <Leader>qe  <Plug>(DBUI_ExecuteQuery)
    vmap <buffer> <Leader>qe  <Plug>(DBUI_ExecuteQuery)
    nmap <buffer> <Leader>qs  <Plug>(DBUI_SaveQuery)
    " nmap <buffer> <Leader>qe  <Plug>(DBUI_EditBindParameters)
endif
