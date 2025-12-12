" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

function! hl#sql#query_text_obj() abort
    " It switches to visual mode and searches for the next ; character.
    " searches forward for the next ; character or the ending of the file
    call search("\\(;\\|\\%$\\)", "cWz")
    " and then search backward for the previous ; character or the beginning of the file
    call search("\\(;\\|\\%^\\)", "bsW")
    " Finally, it moves one character forward to position the cursor correctly.
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
