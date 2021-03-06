" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" vim 进入时的判断
func! Enter()
        if !g:is_in_gui " 终端运行且没有参数
            " exec 'Startify'
    if argc() == 0
        elseif g:is_in_gui " gui 运行且没有参数
            " exec 'NERDTree' . '$HKMS' | wincmd p | exec 'Startify'
            cd $HKMS
        endif
    else
        " do nothing
    endif
endfunc

func! MapMetaCode(key)
    exec "set <M-" . a:key . ">=\e" . a:key
endfunc

func! GetOnlyDirectory()
    " if &filetype ==# 'netrw'
    "     return getcwd()
    " else
    return resolve(expand('%:p:h'))
    " endif
endfunc

func! GetOnlyFileName()
    if &filetype ==# 'netrw'
        return ''
    else
        return resolve(expand('%:t'))
    endif
endfunc

" echo path
func! EchoPath()
    echo GetOnlyDirectory() . '/' . GetOnlyFileName()
endfunc


" 移除行尾空格
func! TrimTrailingWhitespace()
    let l:save = winsaveview() " 保存当前 window 状态 (光标位置等)
    keeppatterns %s/\s\+$//e " 不添加到查找历史记录中
    call winrestview(l:save) " 恢复 window 窗口状态
endfun

" 在浏览器中打开当前选择的链接
function! OpenInBrowser(mode)
    let final_url = ''
    if a:mode ==? 'v' " visual 模式下, 打开选中的文字
        let selected_text = hl#text#get_visual_selection()
    elseif a:mode ==? 'n' " normal 模式下, 打开当前文字
        let selected_text = expand('<cWORD>')
    endif

    " open as vim-plug
    if &ft ==? 'vim'
        let text = matchstr(getline('.'), '"*\s*Plug\s*''\zs.*\ze''')
        if text != ''
            let final_url = shellescape('https://github.com/' . text, 1)
        else
            let suspect_url = hl#text#get_url_formatted_string(selected_text)
            if suspect_url != "''" " 是个正常链接
                let final_url = suspect_url
            else " 如果是一个单词, 那么 google 它
                let final_url = shellescape('https://google.com/search?q=' . hl#text#url_encode(selected_text), 1)
            endif
        endif
    else
        let suspect_url = hl#text#get_url_formatted_string(selected_text)
        if suspect_url != "''" " 如果是一个链接
            let final_url = suspect_url
        else " 如果是一个单词, 那么 google 它
            let final_url = shellescape('https://google.com/search?q=' . hl#text#url_encode(selected_text), 1)
        endif
    endif

    exec "!open -a Safari " . final_url
    :redraw!
endfunction

" 对 JSON 数据进行转义
func! UnescapeJSON()
    setf json
    " MARK: method 1: use sed
    " sed -e 's/\\\"/\"/g' -e 's/^.//g' -e 's/.$//g'
    " MARK: method 2: use vim regex
    " %s/\\"/"/g 
    " %s/^.//g
    " %s/.$//g
    " Autoformat
    " MARK: method 3: use jq
    %!jq '. | fromjson' --indent 4
endfunc

" 对 JSON 数据进行去除转义
func! EscapeJSON()
    " MARK: method 1: use vim regrex
    " %s/"/\\"/g
    " %s/\s//g
    " %s/\n//g
    " %s/^/"/g
    " %s/$/"/g
    " MARK: method 2: use jq(1)
    " %!jq -R -s '.'
    " MARK: method 2: use jq(2)
    " %!jq @json
    " MARK: method 2: use jq(3)
    " %!jq '. | tostring'
    " MARK: method 2: use jq(4)
    %!jq '. | tojson'

endfunc

" open frontmost vim path in mac finder
func! OFD()
    execute "![ -f \"%:p\" ] && open -R \"%:p\" || open \"%:p:h\""
endfunction

" change to the explorer interface of current path of mac finder
func! CDF()
    let l:path = system("osascript -e 'tell application \"Finder\" to POSIX path of (target of window 1 as alias)'")
    " let l:final_path = substitute(l:path, '[\x0]', '', 'g')
    exec 'e '. l:path
endfunction

" change to the explorer interface of current path of iterm2
func! CDIT()
    let l:path = system("pfit")
    exec 'e '. l:path
endfunction

" change to the explorer interface of current path of Xcode
func! MVXC()
    let l:path = system("pfxc")
    exec 'tabnew '. l:path
endfunction

" add path to vim from environment variables
" This is a list of directories which will be searched when using the
" |gf|, [f, ]f, ^Wf, |:find|, |:sfind|, |:tabfind| and other commands
function! ExpandPathFromEnv(paths_arr)
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

" echo runtimepath
func! EchoRunPath()
    for I in split(&rtp, ',')
        echo I
    endfor
endfunction

" makes * and # work on visual mode too.  global function so user mappings can call it.
" specifying 'raw' for the second argument prevents escaping the result for vimgrep
" TODO: there's a bug with raw mode.  since we're using @/ to return an unescaped
" search string, vim's search highlight will be wrong.  Refactor plz.
function! VisualStarSearchSet(cmdtype,...)
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

" Redirect output to a single window
function! Redir(cmd)
    for win in range(1, winnr('$'))
        if getwinvar(win, 'scratch')
            execute win . 'windo close'
        endif
    endfor
    if a:cmd =~ '^!'
        let output = system(matchstr(a:cmd, '^!\zs.*'))
    else
        redir => output
        execute a:cmd
        redir END
    endif
    botright vnew
    let w:scratch = 1
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    call setline(1, split(output, "\n"))
endfunction

" Get output of a command
function! GetOutput(cmd)
    if a:cmd =~ '^!'
        let output = system(matchstr(a:cmd, '^!\zs.*'))
    else
        redir => output
        silent execute a:cmd
        redir END
    endif
    let output = substitute(output, '[\x0]', '', 'g')
    return output
endfunction
