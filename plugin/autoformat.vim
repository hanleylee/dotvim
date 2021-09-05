" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('vim-autoformat')
    finish
endif

let g:autoformat_autoindent = 0
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1
let g:autoformat_verbosemode=1

" let g:formatdef_hl_c='"clang-format -style=\"{BasedOnStyle: LLVM, UseTab: Never, IndentWidth: 4, PointerAlignment: Right, ColumnLimit: 150, SpacesBeforeTrailingComments: 1}\""' "指定格式化的方式, 使用配置参数
let g:formatdef_hl_c='"clang-format -style=file"' "指定格式化的文件, 从项目路径依次向上查找
let g:formatdef_hl_shfmt='"shfmt -i=4"'
let g:formatdef_hl_js_beautify='"js-beautify --config ~/.config/js-beautify/.jsbeautifyrc"'
let g:formatdef_hl_html_beautify='"html-beautify --config ~/.config/js-beautify/.jsbeautifyrc"'
let g:formatdef_hl_css_beautify='"css-beautify --config ~/.config/js-beautify/.jsbeautifyrc"'
let g:formatdef_hl_jq='"jq --indent 4"'
let g:formatdef_hl_yq='"yq e -I4"'
let g:formatdef_hl_sqlformat = '"sqlformat --keywords upper -"'
let g:formatdef_hl_swiftformat = '"swiftformat --quiet"'
let g:formatdef_hl_autopep8 = '"autopep8 - --global-config ~/.config/autopep8/pystyle.toml"'
let g:formatdef_hl_gofmt = '"gofmt"'
let g:formatdef_hl_rustfmt = '"rustfmt --edition 2018"'
let g:formatdef_hl_cmake_format = '"cmake-format - -c ~/.config/cmake-format/cmake-format.yaml"'
let g:formatdef_hl_rbeautify = '"ruby-beautify"'
let g:formatdef_hl_dartfmt = '"dartfmt"'
let g:formatdef_hl_perltidy = '"perltidy"'
let g:formatdef_hl_latexindent = '"latexindent"'

let g:formatters_c = ['hl_c']
let g:formatters_cpp = ['hl_c']
let g:formatters_objc = ['hl_c']
let g:formatters_objcpp = ['hl_c']
let g:formatters_json = ['hl_jq']
let g:formatters_jsonc = ['hl_jq']
let g:formatters_javascript = ['hl_js_beautify']
let g:formatters_html = ['hl_html_beautify']
let g:formatters_xml = ['hl_html_beautify']
let g:formatters_xhtml = ['hl_html_beautify']
let g:formatters_css = ['hl_css_beautify']
let g:formatters_yaml = ['hl_yq']
let g:formatters_sh = ['hl_shfmt']
let g:formatters_zsh = ['hl_shfmt']
let g:formatters_sql = ['hl_sqlformat']
let g:formatters_swift = ['hl_swiftformat']
let g:formatters_python = ['hl_autopep8']
let g:formatters_cmake = ['hl_cmake_format']
let g:formatters_ruby = ['hl_rbeautify']
let g:formatters_dart = ['hl_dartfmt']
let g:formatters_rust = ['hl_rustfmt']
let g:formatters_go = ['hl_gofmt']
let g:formatters_perl = ['hl_perltidy']
let g:formatters_latex = ['hl_latexindent']

let g:formatters_markdown = ['']
