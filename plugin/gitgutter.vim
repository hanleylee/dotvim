" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('vim-gitgutter')
    finish
endif

let g:gitgutter_enabled = 1
let g:gitgutter_map_keys = 0
let g:gitgutter_signs = 1
let g:gitgutter_max_signs = 500 " 最大数量
let g:gitgutter_async = 1 "默认使用异步, 但是实际效果与同步差别几乎没有
let g:gitgutter_log = 0
" let g:gitgutter_highlight_lines = 1 "高亮修改的行
" let g:gitgutter_highlight_linenrs = 1 "To turn on line number highlighting by default
" set signcolumn=yes "默认情况下会自动显示, 亦可通过本选项强制开启
let g:gitgutter_sign_added = '+' "自定义 add 的字符
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '−'
let g:gitgutter_sign_removed_first_line = '−^'
let g:gitgutter_sign_modified_removed = '−~'
let g:gitgutter_sign_priority = 10
let g:gitgutter_sign_allow_clobber = 1
let g:gitgutter_set_sign_backgrounds = 0

let g:gitgutter_git_executable = 'git'
" let g:gitgutter_git_args = ''
" let g:gitgutter_diff_args = ''
" let g:gitgutter_diff_relative_to = ''
" let g:gitgutter_diff_base = '' "diff against any commit
let g:gitgutter_grep = 'grep'

let g:gitgutter_show_msg_on_hunk_jumping = 1

let g:gitgutter_preview_win_floating = 0
let g:gitgutter_preview_win_location = 'bo'
let g:gitgutter_close_preview_on_escape = 1
let g:gitgutter_use_location_list = 0

let g:gitgutter_terminal_reports_focus = 1

"function! GitStatus()
"    let [a,m,r] = GitGutterGetHunkSummary()
"    return printf('+%d ~%d -%d', a, m, r)
"endfunction
"set statusline+=%{GitStatus()}
