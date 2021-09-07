setlocal commentstring=//\ %s
ino <buffer> <silent><expr> <C-]> "\<C-g>u\<C-r>=hl#objc#map_match_bracket()\<CR>"
