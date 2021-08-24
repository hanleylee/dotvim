" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('vim-startify')
    finish
endif

"" 设置书签
let g:startify_bookmarks = [
            \ '~/.vimrc',
            \]
let g:startify_files_number = 10 "起始页显示的列表长度
let g:startify_session_autoload = 1 "是否自动加载目录下的Session.vim, 很好用
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 0
"过滤列表, 支持正则表达式
let g:startify_skiplist = [
            \ '\.vimgolf',
            \ '^/tmp',
            \ '/project/.*/documentation',
            \ ]
"页眉区域显示
let g:startify_custom_header = [
            \ '    __  __               __                 __                   ',
            \ '   / / / /____ _ ____   / /___   __  __    / /   ___   ___       ',
            \ '  / /_/ // __ `// __ \ / // _ \ / / / /   / /   / _ \ / _ \      ',
            \ ' / __  // /_/ // / / // //  __// /_/ /   / /___/  __//  __/      ',
            \ '/_/ /_/ \__,_//_/ /_//_/ \___/ \__, /   /_____/\___/ \___/       ',
            \ '                              /____/                             ',
            \]
"页脚区域显示
let g:startify_custom_footer = [
            \ '+-------------------------------------+',
            \ '|   Swift Shell C Python JavaScript   |',
            \ '+-------------------------------------+',
            \]

" Startify 自动呼叫
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" |g:startify_change_cmd|
" |g:startify_enable_special|
" |g:startify_list_order|
" |g:startify_lists|
let g:startify_update_oldfiles = 1

" |g:startify_commands|
" |g:startify_custom_header_quotes|
" |g:startify_custom_indices|
" |g:startify_disable_at_vimenter|
" |g:startify_enable_unsafe|
" |g:startify_fortune_use_unicode|
" |g:startify_padding_left|
let g:startify_relative_path = 1
" |g:startify_skiplist_server|
" |g:startify_use_env|

" |g:startify_session_before_save|
" |g:startify_session_delete_buffers|
let g:startify_session_dir = "~/.cache/vim/session"
" |g:startify_session_number|
let g:startify_session_persistence = 1
" |g:startify_session_remove_lines|
" |g:startify_session_savecmds|
" |g:startify_session_savevars|
" |g:startify_session_sort|
