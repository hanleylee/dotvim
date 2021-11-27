" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('ultisnips')
    finish
endif

let g:UltiSnipsExpandTrigger='<C-l>'
let g:UltiSnipsJumpForwardTrigger='<Tab>' "触发下一个占位符
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>' "触发上一个占位符
let g:UltiSnipsListSnippets='<M-s>'
let g:UltiSnipsSnippetDirectories=['~/.local/share/snippets'] "定义存放代码片段的文件夹

