if !PlugLoaded('vim-autoformat')
    finish
endif

nnoremap <Leader>af  :Autoformat<CR>

let g:autoformat_autoindent = 0
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1
let g:autoformat_verbosemode=1

" let g:formatdef_hl_c='"clang-format -style=\"{BasedOnStyle: LLVM, UseTab: Never, IndentWidth: 4, PointerAlignment: Right, ColumnLimit: 150, SpacesBeforeTrailingComments: 1}\""' "指定格式化的方式, 使用配置参数
let g:formatdef_hl_c='"clang-format -style=file"' "指定格式化的文件, 从项目路径依次向上查找
let g:formatdef_hl_shfmt='"shfmt -i=4"'
let g:formatdef_hl_js='"js-beautify"'
let g:formatdef_hl_jq='"jq --indent 4"'
let g:formatdef_hl_yq='"yq e -I4"'
let g:formatdef_hl_sqlformat = '"sqlformat --keywords upper -"'
let g:formatdef_hl_swiftformat = '"swiftformat --quiet"'
let g:formatdef_hl_autopep8 = '"autopep8 - --global-config ~/.config/autopep8/pystyle.toml"'

let g:formatters_c = ['hl_c']
let g:formatters_cpp = ['hl_c']
let g:formatters_json = ['hl_jq']
let g:formatters_jsonc = ['hl_jq']
let g:formatters_js = ['hl_js']
let g:formatters_yaml = ['hl_yq']
let g:formatters_sh = ['hl_shfmt']
let g:formatters_sql = ['hl_sqlformat']
let g:formatters_swift = ['hl_swiftformat']
let g:formatters_python = ['hl_autopep8']

let g:formatters_markdown = ['']
