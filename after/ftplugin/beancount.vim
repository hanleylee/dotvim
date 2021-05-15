let b:beancount_root = "$HOME/HL/00_Repo/18_Accounting/main.bean"
let g:beancount_separator_col = 50
" let g:beancount_account_completion = 'default'
let g:beancount_account_completion = 'default'
let g:beancount_detailed_first = 1
inoremap . .<C-\><C-O>:AlignCommodity<CR>

" nnoremap <buffer> <leader>= :AlignCommodity<CR>
" vnoremap <buffer> <leader>= :AlignCommodity<CR>
