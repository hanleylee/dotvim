" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

setlocal commentstring=//\ %s
ino <buffer> <silent><expr> <C-]> "\<C-g>u\<C-r>=hl#objc#map_match_bracket()\<CR>"
