" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" Better keymaps for Netrw{{{
function! netrw#map()
    " Show the list of marked files
    nmap <buffer> fl :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>
    " Show the current target directory
    nmap <buffer> ft :echo 'Target:' . netrw#Expose("netrwmftgt")<CR>
    " Delete a file
    nmap <buffer> fd :call netrw#remove_recursive()<CR>
endfunction
"}}}

" Delete a non-empty directory{{{
function! netrw#remove_recursive()
    if &filetype ==# 'netrw'
        " Prepare the delete command.
        " Make it so that is triggered by just pressing Enter
        cnoremap <buffer> <CR> rm -r<CR>

        " Unmark all files (don't want to delete anything by accident)
        normal mu

        " Mark the file/directory under the cursor
        normal mf

        " Show the prompt to enter the command
        " In here you either press Enter to confirm
        " or press ctrl + c to abort.
        " Don't do anything else!
        try
            normal mx
        catch
            echo "Canceled"
        endtry

        " Undo the Enter keymap
        cunmap <buffer> <CR>
    endif
endfunction
"}}}
