" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

augroup BrewfileDetect
    au!
    au BufNewFile,BufRead Brewfile,.Brewfile set filetype=ruby syntax=brewfile
augroup END
