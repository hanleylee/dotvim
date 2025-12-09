" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" sql query text object
vnoremap <buffer> <silent> aq :<C-U>call hl#sql#query_text_obj()<CR>
onoremap <buffer> <silent> aq :<C-U>call hl#sql#query_text_obj()<CR>

if hl#plug_loaded('vim-dadbod-ui')
    " nmap <buffer> <Leader>qe  <Plug>(DBUI_ExecuteQuery)
    nmap <buffer> <Leader>qe  :call hl#sql#execute_current_query()<CR>
    vmap <buffer> <Leader>qe  <Plug>(DBUI_ExecuteQuery)
    nmap <buffer> <Leader>qs  <Plug>(DBUI_SaveQuery)
    " nmap <buffer> <Leader>qe  <Plug>(DBUI_EditBindParameters)
endif

if g:is_in_macvim_gui && hl#plug_loaded('vim-dadbod-ui')
    nmap <buffer> <D-Return>  :call hl#sql#execute_current_query()<CR>
    vmap <buffer> <D-Return>  <Plug>(DBUI_ExecuteQuery)
endif
" if hl#plug_loaded('vim-dadbod')
"     nmap <expr> <C-Q> db#op_exec()
"     xmap <expr> <C-Q> db#op_exec()
" endif
