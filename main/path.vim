" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

let paths_arr = [
            \ 'include',
            \ 'src/include',
            \ $C_INCLUDE_PATH,
            \ $CPLUS_INCLUDE_PATH,
            \ $OBJC_INCLUDE_PATH,
            \ $CPATH,
            \ $PYTHONPATH,
            \ ]
call ExpandPathFromEnv(paths_arr)

" let s:llvm_path = expand('$HOMEBREW_PREFIX/opt/llvm/bin')
" if isdirectory(s:llvm_path)
"     let $PATH=s:llvm_path.':'.$PATH
" endif

" if hl#plug_loaded('ultisnips')

"     call UltiSnips#bootstrap#Bootstrap()
"     if exists('g:_uspy')
"         " Expand our path to use python lib and functions
"         let s:SourcedFile=expand('<sfile>')
"         exec g:_uspy 'import vim, os, sys'
"         exec g:_uspy "sourced_file = vim.eval('s:SourcedFile')"
"         exec g:_uspy "while not os.path.exists(os.path.join(sourced_file, 'pythonx')): sourced_file = os.path.dirname(sourced_file)"
"         exec g:_uspy "module_path = os.path.join(sourced_file, 'pythonx')"
"         exec g:_uspy 'sys.path.append(module_path)'
"     end

" endif
