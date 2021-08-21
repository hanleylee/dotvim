" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('asynctasks.vim')
    finish
endif

if PlugLoaded('fzf.vim')
    command! -nargs=0 AsyncTaskFzf call hl#asynctasks#fzf_task()
endif
