if !PlugLoaded('asyncrun.vim')
    finish
endif

nnoremap <F10>               :call asyncrun#quickfix_toggle(6)<CR>

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
