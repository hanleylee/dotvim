" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('auto-pairs')
    finish
endif

let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '`':'`', '```':'```', '"""':'"""', "'''":"'''"}
" let g:AutoPairs['<']='>'
" let g:AutoPairs = {'[':']', '{':'}',"'":"'",'"':'"', '`':'`'}
let g:AutoPairsMultilineClose = 1
let g:AutoPairsMoveCharacter = "()[]{}\"'"
let g:AutoPairsShortcutToggle = '<M-P>'
let g:AutoPairsShortcutFastWrap = '<M-F>'
let g:AutoPairsShortcutJump = '<M-N>'
let g:AutoPairsShortcutBackInsert = ''
let g:AutoPairsFlyMode = 0 " 可以严格匹配括号, 跨越多行进行跳转
let g:AutoPairsMapBS = 1
let g:AutoPairsMapCh = 1
let g:AutoPairsMapSpace = 1
let g:AutoPairsMapCR = 0
" inoremap <buffer><silent> ) <C-R>=AutoPairsInsert(')')<CR>
