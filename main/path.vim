call Expand_path_from_env(
            \ $C_INCLUDE_PATH,
            \ $CPLUS_INCLUDE_PATH,
            \ $OBJC_INCLUDE_PATH,
            \ $CPATH,
            \ $PYTHONPATH
            \ )

" let s:llvm_path = expand('$HOMEBREW_PREFIX/opt/llvm/bin')
" if isdirectory(s:llvm_path)
"     let $PATH=s:llvm_path.':'.$PATH
" endif

