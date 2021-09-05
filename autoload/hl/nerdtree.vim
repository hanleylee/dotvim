" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" 开启nerdtree, 根目录在vcs上, 且光标在当前文件{{{
func! hl#nerdtree#toggle_vcs_focus_current()
    if g:NERDTree.IsOpen()
        NERDTreeClose
    else
        let current_file = expand('%:p')
        NERDTreeVCS | exec 'NERDTreeFind' . current_file
    endif
endfunction
"}}}
