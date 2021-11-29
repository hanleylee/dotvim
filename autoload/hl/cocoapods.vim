" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

function! hl#cocoapods#execute(cmd)
    silent update | execute "AsyncRun " . a:cmd . " --project-directory=\"$VIM_FILEDIR\""
endfunction
