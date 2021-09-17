" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

setlocal colorcolumn=
" setlocal autochdir

" Show the list of marked files
nmap <buffer> fl :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>
" Show the current target directory
nmap <buffer> ft :echo 'Target:' . netrw#Expose("netrwmftgt")<CR>
" Delete a file
nmap <buffer> fd :call hl#netrw#remove_recursive()<CR>
