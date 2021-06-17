" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

if !PlugLoaded('vim-gitgutter')
    finish
endif

"let g:gitgutter_max_signs = 500  " default value
"let g:gitgutter_enabled = 0 "To turn off vim-gitgutter by default
"let g:gitgutter_signs = 0 "To turn off signs by default
"let g:gitgutter_highlight_lines = 1 "To turn on line highlighting by default
"let g:gitgutter_highlight_linenrs = 1 "To turn on line number highlighting by default
"set signcolumn=yes "默认情况下会自动显示, 亦可通过本选项强制开启
"let g:gitgutter_override_sign_column_highlight = 0
"highlight SignColumn ctermbg=whatever    " terminal Vim
"highlight SignColumn guibg=whatever      " gVim/MacVim
"highlight GitGutterAdd    guifg=#009900 guibg=#FFFFFF ctermfg=2 ctermbg=3
"highlight GitGutterChange guifg=#bbbb00 guibg=<X> ctermfg=3 ctermbg=<Y>
"highlight GitGutterDelete guifg=#ff2222 guibg=<X> ctermfg=1 ctermbg=<Y>
"highlight GitGutterAdd    guifg=#8dff1b ctermfg=10
"highlight GitGutterChange guifg=#ffef00 ctermfg=13
"highlight GitGutterDelete guifg=#e03131 ctermfg=1
"highlight GitGutterChangeDelete guifg=#e03131 ctermfg=1
"let g:gitgutter_sign_added = '+' "自定义 add 的字符
"let g:gitgutter_sign_modified = '~'
"let g:gitgutter_sign_removed = '−'
"let g:gitgutter_sign_removed_first_line = '−^'
"let g:gitgutter_sign_modified_removed = '−~'
"let g:gitgutter_diff_base = '<commit SHA>' "diff against any commit
"let g:gitgutter_async = 1 "默认使用异步, 但是实际效果与同步差别几乎没有
"let g:gitgutter_highlight_lines = 1 "高亮修改的行

"function! GitStatus()
"    let [a,m,r] = GitGutterGetHunkSummary()
"    return printf('+%d ~%d -%d', a, m, r)
"endfunction
"set statusline+=%{GitStatus()}

