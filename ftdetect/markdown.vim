" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

augroup MarkdownDetect
    au!
    au BufNewFile,BufRead */.cheat/*	setf markdown
augroup END
