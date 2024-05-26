" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

function! hl#git#branch()
    let l:res = systemlist('git rev-parse --abbrev-ref HEAD')[0]
    if match(l:res, 'fatal') != -1
        return ''
    else
        return l:res
    endif
endfunction

