" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('cosco.vim')
    finish
endif

let g:auto_comma_or_semicolon = 1     " Default : 0
let g:auto_comma_or_semicolon_events = ['InsertLeave']
let g:cosco_ignore_comment_lines = 1 " 忽略注释行
let g:cosco_filetype_whitelist = ['cpp', 'c', 'rust']
" let g:cosco_filetype_blacklist = ['vim', 'bash']
" The g:cosco_filetype_whitelist variable will override and ignore the g:cosco_filetype_blacklist variable if both variables are declared in your .vimrc.
