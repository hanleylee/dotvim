" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('inline_edit.vim')
    finish
endif

let g:inline_edit_new_buffer_command = 'tabnew'
let g:inline_edit_proxy_type = 'tempfile' " 使用 temptfile 可以执行外部命令, 缺点是可能会有一些异常的 bug
" let g:inline_edit_proxy_type = 'scratch'
let g:inline_edit_autowrite = 1
let g:inline_edit_modify_statusline = 0 " 使用 tempfile 之后, statusline 基本不会有变化, 可以直接禁用了

" let g:inline_edit_patterns = [ 
"             \{ 
"             \ 'main_filetype':     'vim',
"             \ 'sub_filetype':      'vim',
"             \ 'indent_adjustment': 1,
"             \ 'start':             '\<function\>',
"             \ 'end':               '\<endfunction\>'
"             \ }
"             \ ]
