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
        exec 'cd ~/HL/00_Repo/00_HKMS' | exec 'silent Explore'
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

function! UpdateDiffHunks()
    setlocal nocursorbind
    setlocal noscrollbind
    let winview = winsaveview() 
    let pos = getpos(".")
    sil exe 'normal! gg'
    let moved = 1
    let hunks = []
    while moved
        let startl = line(".")
        keepjumps sil exe 'normal! ]c'
        let moved = line(".") - startl
        if moved
            call add(hunks,line("."))
        endif
    endwhile
    call winrestview(winview)
    call setpos(".",pos)
    setlocal cursorbind
    setlocal scrollbind
    let g:diff_hunks = hunks
endfunction

function! DiffCount()
    if !exists("g:diff_hunks") 
        call UpdateDiffHunks()
    endif
    let n_hunks = 0
    let curline = line(".")
    for hunkline in g:diff_hunks
        if curline < hunkline
            break
        endif
        let n_hunks += 1
    endfor
    let diffCount = len(g:diff_hunks)
    return diffCount == 0 ? '' : n_hunks . '/' . len(g:diff_hunks)
endfunction

if PlugLoaded('vim-quickui')
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
endif

if PlugLoaded('fzf.vim')
    " Search all content use ag
    function! AgAll(query, ...)
        let query = empty(a:query) ? '^(?=.)' : a:query
        return fzf#vim#ag_raw('--hidden '.fzf#shellescape(query).' '.getcwd())
    endfunction
endif

" if PlugLoaded('coc.nvim')
" endif
