" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

augroup LogDetect
    au!
    au BufNewFile,BufRead *.log* setfiletype log
augroup END
