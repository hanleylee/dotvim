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

" source file, avoid long expression
func! Source(filename)
    exec 'source '.expand(a:filename)
endfunction

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

func! QuickMenu()
    call quickui#menu#reset()
    " install a 'File' menu, use [text, command] to represent an item.
    call quickui#menu#install('&File', [
                \ [ "&New File\tCtrl+n", 'echo 0' ],
                \ [ '&Open File\t(F3)', 'echo 1' ],
                \ [ '&Close', 'echo 2' ],
                \ [ '--', '' ],
                \ [ '&Save\tCtrl+s', 'echo 3'],
                \ [ 'Save &As', 'echo 4' ],
                \ [ 'Save All', 'echo 5' ],
                \ [ '--', '' ],
                \ [ 'E&xit\tAlt+x', 'echo 6' ],
                \ ])

    " items containing tips, tips will display in the cmdline
    call quickui#menu#install('&Edit', [
                \ [ '&Copy', 'echo 1', 'help 1' ],
                \ [ '&Paste', 'echo 2', 'help 2' ],
                \ [ '&Find', 'echo 3', 'help 3' ],
                \ ])

    " script inside %{...} will be evaluated and expanded in the string
    call quickui#menu#install('&Option', [
                \ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
                \ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
                \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
                \ ])

    call quickui#menu#install('&C/C++', [
                \ [ '&Compile', 'echo 1' ],
                \ [ '&Run', 'echo 2' ],
                \ ], '<auto>', 'c,cpp')

    " register HELP menu with weight 10000
    call quickui#menu#install('H&elp', [
                \ ['&Cheatsheet', 'help index', ''],
                \ ['T&ips', 'help tips', ''],
                \ ['--',''],
                \ ['&Tutorial', 'help tutor', ''],
                \ ['&Quick Reference', 'help quickref', ''],
                \ ['&Summary', 'help summary', ''],
                \ ], 10000)
    call quickui#menu#open()
endfunction

