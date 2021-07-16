" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

" 是否加载了 plug
function! PlugLoaded(name)
    return has_key(g:plugs, a:name)
endfunction

" vim 进入时的判断
func! Enter()
    if argc() == 0 && !has('gui_running')
        exec 'silent Explore'
    elseif argc() == 0 && has('gui_running')
        exec 'cd ~/data/00_repo/00_hkms' | exec 'silent Explore'
    endif
endfunc

" echo path
func! EchoPath()
    echo expand('%:p')
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
