" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('YouCompleteMe')
    finish
endif

let g:ycm_global_ycm_extra_conf = '~/.config/ycm/.ycm_extra_conf.py' " 默认配置文件路径
let g:ycm_confirm_extra_conf=0 "打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_seed_identifiers_with_syntax=1 "是否开启语义补全
let g:ycm_key_invoke_completion = '<C-z>' "语义补全触发方式
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,vim,lua,javascript,swift,bash,zsh,sh': ['re!\w{2}'],
            \ }
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>'] "设置用于向上选择补全列表中的选项的快捷键, 默认爲 shift + tab, 和方向上键
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_min_num_of_chars_for_completion=2 "开始补全的字符数
let g:ycm_max_num_candidates=50 "设置语义补全的最大候选项数量, 0 表示没有限制
let g:ycm_max_num_identifier_candidates = 10 "设置标识符补全的最大候选项数量, 0 表示没有限制
let g:ycm_add_preview_to_completeopt = 1 "自动弹出函数原型预览的窗口, 非常棒, 与 completeopt popup 相辅相成
let g:ycm_autoclose_preview_window_after_completion=1 "补全后自动关机预览窗口
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_use_ultisnips_completer = 1 "自动请求 ultisnips 的片段
let g:ycm_show_diagnostics_ui = 0 "关闭 ycm 代码检查工具, 使用 ale 进行静态检查
let g:ycm_use_clangd = 1
let g:ycm_clangd_uses_ycmd_caching = 0 " Let clangd fully control code completion
" let g:ycm_clangd_binary_path = '$HOMEBREW_PREFIX/opt/llvm/bin/clangd'
" let g:ycm_filetype_whitelist = {
"             \ "c":1,
"             \ "cpp":1,
"             \ "python":1,
"             \ "java":1,
"             \ "go":1,
"             \ "erlang":1,
"             \ "perl":1,
"             \ "vim":1,
"             \ "markdown":1,
"             \ "swift":1,
"             \ "sh":1,
"             \ "zsh":1,
"             \ "zimbu":1,
"             \ "objc":1,
"             \ "yaml":1,
"             \ "json":1,
"             \ "conf":1,
"             \ } "文件类型白名单, vim打开这些类型文件时会开启YCM. *表示所有文件类型
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'mail' : 1
            \ } "文件类型黑名单, vim打开这些类型文件时会关闭YCM
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"
let g:ycm_cache_omnifunc = 0 "禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_complete_in_strings=1 "字符串中也开启补全
let g:ycm_complete_in_comments=1 "是否在注释中也开启补全
" let g:ycm_key_list_stop_completion=['<CR>']
let g:ycm_filetype_specific_completion_to_disable={'gitcommit': 1} "语义补全黑名单, vim打开这些类型文件时会关闭YCM语义补全, 但标识符补全仍可用
let g:ycm_filepath_blacklist = {'html' : 1, 'jsx' : 1,'xml' : 1,} "对特定文件类型禁用文件路径补全
let g:ycm_disable_signature_help = 1 "移除函数定义的提示, 使用 echodoc 进行替代
let g:ycm_auto_hover='CursorHold' "or `CursorHold`
let g:ycm_clangd_args = ['-cross-file-rename'] 
