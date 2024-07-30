" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-markdown')
    finish
endif

" For preservim/vim-markdown {{{
" let g:vim_markdown_folding_disabled = 1 "太耗费性能
let g:vim_markdown_folding_level = 3 "文件打开时显示的目录总级别
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_auto_insert_bullets = 0 "换行时自动插入项目符号
let g:vim_markdown_new_list_item_indent = 0 " 在排序项目上按 o 换行出现的缩进
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_conceal = 1 " To disable conceal regardless of 'conceallevel' setting, use 0
let g:vim_markdown_conceal_code_blocks = 0 " 对代码不取消隐藏符号
let g:vim_markdown_strikethrough = 1 " 加删除线
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_fenced_languages = ['c++=cpp', 'viml=vim', 'bash=sh', 'ini=dosini']
" let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_follow_anchor = 0
" let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
" let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
" let g:vim_markdown_auto_extension_ext = 'txt'
" }}}

" For tpope/vim-markdown {{{
" let g:markdown_fenced_languages = [
"             \ 'html',
"             \ 'python',
"             \ 'bash=sh',
"             \ 'c',
"             \ 'cpp',
"             \ 'swift',
"             \ 'json',
"             \ 'xml',
"             \ 'ini=dosini',
"             \ 'ruby',
"             \ ]
" let g:markdown_minlines = 100
" let g:markdown_folding = 1
" let g:markdown_syntax_conceal = 1
" }}}
