" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" echo path
func! hl#util#EchoPath()
    echo hl#get#FullPathName()
endfunc

" echo runtimepath
func! hl#util#EchoRunPath()
    for I in split(&rtp, ',')
        echo I
    endfor
endfunction

" add path to vim from environment variables
" This is a list of directories which will be searched when using the
" |gf|, [f, ]f, ^Wf, |:find|, |:sfind|, |:tabfind| and other commands
function! hl#util#ExpandPathFromEnv(paths_arr)
    " for path_str in a:000
    for path_str in a:paths_arr
        let paths=split(path_str, ':')

        for path in paths
            let expanded_path = expand(path)
            if isdirectory(expanded_path)
                execute 'set path+=' . expanded_path
            endif
        endfor
    endfor
endfunction

" makes * and # work on visual mode too.  global function so user mappings can call it. specifying 'raw' for the second argument prevents escaping the result for vimgrep
" TODO: there's a bug with raw mode. since we're using @/ to return an unescaped search string, vim's search highlight will be wrong. Refactor plz.
function! hl#util#VisualStarSearchSet(cmdtype,...)
    let temp = @"
    normal! gvy
    if !a:0 || a:1 != 'raw'
        let @" = escape(@", a:cmdtype.'\*')
    endif
    let @/ = substitute(@", '\n', '\\n', 'g')
    let @/ = substitute(@/, '\[', '\\[', 'g')
    let @/ = substitute(@/, '\~', '\\~', 'g')
    let @/ = substitute(@/, '\.', '\\.', 'g')
    let @" = temp
endfunction

