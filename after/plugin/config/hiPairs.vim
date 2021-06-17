" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

if !PlugLoaded('hiPairs')
    finish
endif

" 匹配符号样式设置
let g:hiPairs_hl_matchPair = { 'term'    : 'underline,bold',
            \                  'cterm'   : 'bold',
            \                  'ctermfg' : '0',
            \                  'ctermbg' : '180',
            \                  'gui'     : 'bold',
            \                  'guifg'   : 'Black',
            \                  'guibg'   : '#21D96E' }
"
" 无匹配符号样式设置
let g:hiPairs_hl_unmatchPair = { 'term'    : 'underline,italic',
            \                    'cterm'   : 'italic',
            \                    'ctermfg' : '15',
            \                    'ctermbg' : '12',
            \                    'gui'     : 'italic',
            \                    'guifg'   : 'White',
            \                    'guibg'   : 'Red' }

