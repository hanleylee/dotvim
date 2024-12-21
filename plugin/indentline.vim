" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('indentLine')
    finish
endif

let g:indentLine_char = '|'                " 设置缩进线字符
let g:indentLine_concealcursor = 'inc'     " 默认设置, 设置隐藏字符在何种模式下隐藏, i 为 insert, n 为 normal, v 为 visual
let g:indentLine_conceallevel = 1          " 此为默认插件强制且默认选项, 默认设置为 1, 如果设置为0 则缩进线插件不会生效, 等价于设置 set conceallevel=1, 系统一共有四级, 0~3
let g:indentLine_fileTypeExclude = ['txt', 'markdown', 'json', 'jsonc', 'json5', 'csv', 'asciiart', 'rst'] " 排除类型
let g:indentLine_bufNameExclude = ['_.*', '*.md', '*.json',  '*.jsonc', '*.json5', '*.csv', '*.asciiart', '*.rst']
let g:indentLine_bufTypeExclude = ['help', 'terminal', 'markdown', 'json', 'jsonc', 'json5', 'csv', 'asciiart', 'rst']
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#4D4D4D'
