" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

augroup RubyDetect
    au!
    au BufNewFile,BufRead Podfile setf ruby
    au BufNewFile,BufRead *.podspec setf ruby
augroup END
