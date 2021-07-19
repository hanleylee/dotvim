" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

"silent w
"if &filetype ==? 'c'
"    "exec 'AsyncRun gcc % -o build/%< && ./build/%<' "花了一晚上研究出来的可用方案
"    "exec 'AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/build/$(VIM_FILENOEXT)" && ./build/"$(VIM_FILENOEXT)"'
"    AsyncRun! gcc `pkg-config --cflags --libs glib-2.0` -Wall -O2 "$(VIM_FILEPATH)" -o "$HOME/.cache/build/c/$(VIM_FILENOEXT)" && "$HOME/.cache/build/c/$(VIM_FILENOEXT)"
"elseif &filetype ==? 'cpp'
"    " exec 'AsyncRun! g++ -stdc++11 % -o %<; time ./%<'
"    AsyncRun! clang++ -Wall -std=c++11 "$(VIM_FILEPATH)" -o "$XDG_CACHE_HOME/build/cpp/$(VIM_FILENOEXT)" && "$XDG_CACHE_HOME/build/cpp/$(VIM_FILENOEXT)"
"elseif &filetype ==? 'objc'
"    AsyncRun! clang -framework Foundation "$(VIM_FILEPATH)" -o "$XDG_CACHE_HOME/build/objc/$(VIM_FILENOEXT)" && "$XDG_CACHE_HOME/build/objc/$(VIM_FILENOEXT)"
"elseif &filetype ==? 'java'
"    AsyncRun! javac %; time java %<
"elseif &filetype ==? 'sh'
"    AsyncRun! time bash %
"elseif &filetype ==? 'lua'
"    AsyncRun! time %
"elseif &filetype ==? 'perl'
"    AsyncRun! time %
"elseif &filetype ==? 'ruby'
"    AsyncRun! time %
"elseif &filetype ==? 'javascript'
"    AsyncRun! time node %
"elseif &filetype ==? 'swift'
"    AsyncRun! swiftc -o "$HOME/.cache/build/swift/$(VIM_FILENOEXT)" "$(VIM_FILEPATH)" && "$HOME/.cache/build/swift/$(VIM_FILENOEXT)"
"elseif &filetype ==? 'python'
"    AsyncRun! time python3 %
"elseif &filetype ==? 'html'
"    silent !open %
"elseif &filetype ==? 'xhtml'
"    silent !open %
"elseif &filetype ==? 'go'
"    AsyncRun! go build %<; time go run %
"elseif &filetype ==? 'vim'
"    source %
"elseif &filetype ==? 'markdown'
"    silent MarkdownPreview
"else
"    echom 'Current filetype is not supported!'
"endif
