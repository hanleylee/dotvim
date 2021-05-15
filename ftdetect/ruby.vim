augroup RubyDetect
    au!
    au BufNewFile,BufRead Podfile setf ruby
    au BufNewFile,BufRead *.podspec setf ruby
augroup END
