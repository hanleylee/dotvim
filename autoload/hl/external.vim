" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" 在浏览器中打开当前选择的链接
function! hl#external#OpenInBrowser(mode)
    let final_url = ''
    if a:mode ==? 'v' " visual 模式下, 打开选中的文字
        let selected_text = hl#text#visual_selection()
    elseif a:mode ==? 'n' " normal 模式下, 打开当前文字
        let selected_text = expand('<cWORD>')
    endif

    " open as vim-plug
    if &ft ==? 'vim'
        let text = matchstr(getline('.'), '"*\s*Plug\s*''\zs.\{-}\ze''')
        if text != ''
            let final_url = shellescape('https://github.com/' . text, 1)
        else
            let suspect_url = hl#text#url_formatted_string(selected_text)
            if suspect_url != "''" " 是个正常链接
                let final_url = suspect_url
            else " 如果是一个单词, 那么 google 它
                let final_url = shellescape('https://google.com/search?q=' . hl#text#url_encode(selected_text), 1)
            endif
        endif
    else
        let suspect_url = hl#text#url_formatted_string(selected_text)
        if suspect_url != "''" " 如果是一个链接
            let final_url = suspect_url
        else " 如果是一个单词, 那么 google 它
            let final_url = shellescape('https://google.com/search?q=' . hl#text#url_encode(selected_text), 1)
        endif
    endif

    exec "!open -a Safari " . final_url
    :redraw!
endfunction

" open frontmost vim path in mac finder
func! hl#external#OFD()
    execute "![ -f \"%:p\" ] && open -R \"%:p\" || open \"%:p:h\""
endfunction

" change to the explorer interface of current path of mac finder
func! hl#external#CDF()
    let l:path = system("osascript -e 'tell application \"Finder\" to POSIX path of (target of window 1 as alias)'")
    " let l:final_path = substitute(l:path, '[\x0]', '', 'g')
    exec 'e '. l:path
endfunction

" change to the explorer interface of current path of iterm2
func! hl#external#CDIT()
    let l:path = system("pfit")
    exec 'e '. l:path
endfunction

" change to the explorer interface of current path of Xcode
func! hl#external#MVXC()
    let l:path = system("pfxc")
    exec 'tabnew '. l:path
endfunction

" Get output of a command
function! hl#external#GetOutput(cmd)
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

" Redirect output to a single window
function! hl#external#Redir(cmd)
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