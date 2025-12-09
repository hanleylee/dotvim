" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

function! hl#sql#query_text_obj() abort
    " It searches backward for the last ; character or the beginning of the file
    " and then from there forward for the next SQL keyword (I'm sure the list there might be refined, this worked for me though).
    " It switches to visual mode and searches for the next ; character.
    call search(";", "cWz")
    call search("\\(;\\|\\%^\\)", "bsW")
    call search("^.", "cWz")
    execute "normal! vg`'"
endfunction

if hl#plug_loaded('vim-dadbod-ui')
    function! hl#sql#execute_current_query()
        let b:view = winsaveview()
        call hl#sql#query_text_obj()
        execute "normal \<Plug>(DBUI_ExecuteQuery)"
        call winrestview(b:view)
    endfunction
endif
