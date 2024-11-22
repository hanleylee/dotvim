" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" echo path
func! hl#util#EchoPath()
    echo hl#fs#getFullPathName()
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

function! hl#util#ShouldMakeView()
    if has('quickfix') && &buftype =~ 'nofile'
        " Buffer is marked as not a file
        return 0
    endif
    if empty(glob(expand('%:p')))
        " File does not exist on disk
        return 0
    endif
    if len($TEMP) && expand('%:p:h') == $TEMP
        " We're in a temp dir
        return 0
    endif
    if len($TMP) && expand('%:p:h') == $TMP
        " Also in temp dir
        return 0
    endif
    if index(g:skipview_files, expand('%')) >= 0
        " File is in skip list
        return 0
    endif
    return 1
endfunction

" Permanently delete views created by 'mkview'
function! hl#util#DeleteView()
    let path = fnamemodify(bufname('%'), ':p')
    " vim's odd =~ escaping for /
    let path = substitute(path, '=', '==', 'g')
    if empty($HOME)
    else
        let path = substitute(path, '^' . $HOME, '\~', '')
    endif
    let path = substitute(path, '/', '=+', 'g') . '='
    " view directory
    let path = &viewdir . '/' . path
    call delete(path)
    echo "Deleted: " . path
endfunction

function! hl#util#SearchMatchCount()
    " 获取当前搜索模式
    let l:pattern = @/
    " 如果搜索模式为空，返回空字符串
    if empty(l:pattern)
        return ''
    endif

    let l:search_res = searchcount({'maxcount': 0})
    let l:current = l:search_res.current
    let l:total = l:search_res.total

    " 返回匹配数
    echo l:current . '/' . l:total
endfunction

let g:lv_restore_last_im = 0

function! hl#util#AutoIM(event)
	let is_abc = system('is_abc') != ''

	let need_switch_im = 0
	if a:event == 'leave'
		if !is_abc
			let g:lv_restore_last_im = 1
			let need_switch_im = 1
		else
			let g:lv_restore_last_im = 0
		end
	else " a:event == 'enter'
		if is_abc && g:lv_restore_last_im
			let need_switch_im = 1
		end
	end

	if need_switch_im 
		silent !simulate_ctrl_space
	end
endfunction
