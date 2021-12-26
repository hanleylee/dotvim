" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" Configuration file located at ~/.vim/coc-settings.json

if !hl#plug_loaded('coc.nvim')
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
let g:coc_global_extensions = [
            \ 'coc-clangd',
            \ 'coc-cmake',
            \ 'coc-css',
            \ 'coc-db',
            \ 'coc-diagnostic',
            \ 'coc-dictionary',
            \ 'coc-emoji',
            \ 'coc-flutter',
            \ 'coc-gitignore',
            \ 'coc-go',
            \ 'coc-highlight',
            \ 'coc-html',
            \ 'coc-java',
            \ 'coc-json',
            \ 'coc-julia',
            \ 'coc-lua',
            \ 'coc-markdownlint',
            \ 'coc-omni',
            \ 'coc-pyright',
            \ 'coc-r-lsp',
            \ 'coc-rome',
            \ 'coc-rust-analyzer',
            \ 'coc-snippets',
            \ 'coc-solargraph',
            \ 'coc-sourcekit',
            \ 'coc-syntax',
            \ 'coc-tag',
            \ 'coc-tsserver',
            \ 'coc-vetur',
            \ 'coc-vimlsp',
            \ 'coc-word',
            \ 'coc-yaml',
            \ 'coc-yank',
            \ ]
