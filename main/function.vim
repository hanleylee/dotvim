" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" vim 进入时的判断
func! Enter()
    if argc() == 0
        if !g:is_in_gui " 终端运行且没有参数
            " exec 'Startify'
        elseif g:is_in_gui " gui 运行且没有参数
            " exec 'NERDTree' . '$HKMS' | wincmd p | exec 'Startify'
            cd $HKMS
        endif
    else
        " do nothing
    endif
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
func! TrimWhitespace()
    let l:save = winsaveview() " 保存当前 window 状态 (光标位置等)
    keeppatterns %s/\s\+$//e " 不添加到查找历史记录中
    call winrestview(l:save) " 恢复 window 窗口状态
endfun

" browse plugin homepage
function! PlugBrowse()
    if &ft != 'vim'
        echo 'error: filetype is not vim'
        return
    endif
    let t = matchstr(getline('.'), '^\s*Plug\s*''\zs.*\ze''')
    if t != ''
        exec "!open" 'https://github.com/'.t
    endif
endfunc

" 对 JSON 数据进行转义
func! UnescapeJSON()
    setf json
    %s/\\"/"/g
    Autoformat
endfunc

" 对 JSON 数据进行去除转义
func! EscapeJSON()
    %s/"/\\"/g
    %s/\s//g
    %s/\n//g
endfunc

" open frontmost vim path in mac finder
func! OFD()
    execute "![ -f \"%:p\" ] && open -R \"%:p\" || open \"%:p:h\""
endfunction

" change to the explorer interface of current path of mac finder
func! CDF()
    let l:current_path = system("osascript -e 'tell application \"Finder\" to POSIX path of (target of window 1 as alias)'")
    let l:final_path = substitute(l:current_path, '[\x0]', '', 'g')
    exec 'Exp ' l:final_path
endfunction

" add path to vim from environment variables
function! Expand_path_from_env(...)
    for path_str in a:000
        let paths=split(path_str, ':')

        for path in paths
            let expanded_path = expand(path)
            if isdirectory(expanded_path)
                execute 'set path+=' . expanded_path
            endif
        endfor
    endfor
endfunction
