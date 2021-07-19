" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

if !PlugLoaded('vim-beancount')
    finish
endif

let b:beancount_root = '$HOME/data/00_repo/18_accounting/main.bean'
let g:beancount_separator_col = 50
" let g:beancount_account_completion = 'default'
let g:beancount_account_completion = 'default'
let g:beancount_detailed_first = 1
