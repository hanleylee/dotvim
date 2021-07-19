" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('asyncrun.vim')
    finish
endif

let g:asyncrun_rootmarks = [
            \ '.svn', 
            \ '.git', 
            \ '.root', 
            \ '.project', 
            \ '.hg', 
            \ '_darcs', 
            \ 'build.xml'
            \ ]
let g:asyncrun_open = 10 " 自动打开 quickfix window ，高度为 6
let g:asyncrun_bell = 0  " 任务结束时候响铃提醒
