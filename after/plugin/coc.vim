" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

if !PlugLoaded('coc.nvim')
    finish
endif

" inoremap <silent><expr> <TAB>
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" " \ pumvisible() ? coc#_select_confirm() : "help select first complete when there's no selected.

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'
