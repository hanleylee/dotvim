" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

augroup RubyDetect
    au!
    au BufNewFile,BufRead Fastfile setf ruby
    au BufNewFile,BufRead Appfile setf ruby
augroup END
