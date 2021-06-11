" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

if !PlugLoaded('ale')
    finish
endif

let g:ale_enabled = 1
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fixers = {
            \   '*': ['remove_trailing_lines','trim_whitespace' ],
            \   'python': ['autopep8']
            \}
let g:ale_set_highlights = 0
"let g:ale_fix_on_save = 1 "auto Sava
let g:ale_echo_cursor = 1
let g:ale_echo_msg_error_str = ''
let g:ale_echo_msg_warning_str = ''
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_echo_delay = 20
let g:ale_set_balloons = 1
let g:ale_hover_cursor = 0
let g:ale_sign_column_always = 1 "始终开启标志列
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_cursor_detail = 0 " 移动到当前行的时候会在底部预览窗口(比较大, 会改变窗口布局)内显示详细信息
let g:ale_completion_enabled = 0
let g:ale_lint_delay = 500
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 0
let g:ale_list_window_size = 5
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
let g:ale_virtualtext_cursor = 0

let g:ale_linters = {
            \   'c': ['clangd'],
            \   'cpp': ['clangd'],
            \   'swift': ['swiftlint'],
            \   'markdown': ['markdownlint'],
            \   'python': ['pylint'],
            \   'vim': ['vint'],
            \   'json': ['jsonlint'],
            \   'sh': ['shellcheck'],
            \   'zsh': ['shellcheck'],
            \   'yaml': ['yamllint']
            \}

let g:ale_fixers = {
            \   'swift': ['swiftformat']
            \}
let g:ale_c_clangd_executable = $HOMEBREW_PREFIX.'/opt/llvm/bin/clangd'
let g:ale_cpp_clangd_executable = $HOMEBREW_PREFIX.'/opt/llvm/bin/clangd'
" let g:ale_cpp_clangd_options = '-std=c++18'
" let g:ale_cpp_clangd_options = '' "不能使用 $CFLAGS, 这个是 clangd 的命令选项
" let g:ale_c_gcc_options = '-Wall -O2 -std=c99 -I/usr/local/Cellar/glib/2.66.7/include/glib-2.0'
" let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
" let g:ale_c_cppcheck_options = ''
" let g:ale_cpp_cppcheck_options = ''

let g:ale_markdown_markdownlint_options='-c $HOME/.markdownlint.json'
