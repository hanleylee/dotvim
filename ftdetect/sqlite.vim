" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

augroup SQLDetect
    au!
    au BufNewFile,BufRead *.sqlite setfiletype sqlite
augroup END
