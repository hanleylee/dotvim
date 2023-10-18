" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" 在浏览器中打开当前选择的链接
function! hl#external#OpenVimPluginHomepage(mode)
    if a:mode ==? 'v' " visual 模式下, 打开选中的文字
        let selected_text = hl#text#visual_selection()
    elseif a:mode ==? 'n' " normal 模式下, 打开当前文字
        let selected_text = expand('<cWORD>')
    endif

    let full_pathname = hl#fs#getFullPathName()
    let repo_filename = FindRootDirectory()
    let just_filename = hl#fs#getOnlyFileName()
    if a:mode ==? 'v'
        let plug = selected_text
    elseif a:mode ==? 'n'
        let plug = matchstr(getline('.'), '"*\s*Plug\s*''\zs.\{-}\ze''')
    endif
    if plug != ''
        let final_url = shellescape('https://github.com/' . plug, 1)
        exec "!open -a Safari " . final_url
        :redraw!
    else
        echoerr 'selected text not valid'
    endif
endfunction

" 在浏览器中打开当前选择的链接
function! hl#external#OpenInBrowser(mode)
    let final_url = ''
    if a:mode ==? 'v' " visual 模式下, 打开选中的文字
        let selected_text = hl#text#visual_selection()
    elseif a:mode ==? 'n' " normal 模式下, 打开当前文字
        let selected_text = expand('<cWORD>')
    endif

    let suspect_url = hl#text#url_formatted_string(selected_text)
    if suspect_url != "''" " 如果是一个链接
        let final_url = suspect_url
    else " 如果是一个单词, 那么 google 它
        let final_url = shellescape('https://google.com/search?q=' . hl#text#url_encode(selected_text), 1)
    endif

    exec "!open -a Safari " . final_url
    :redraw!
endfunction

" is able to open:
" - markdown links [Hacker news](https://news.ycombinator.com 'link to Hacker news website');
" - asciidoc links https://news.ycombinator.com[Hacker news];
" - html links <a href="https://news.ycombinator.com">Hacker news</a>;
" - and usual barebone urls https://news.ycombinator.com.
function! hl#external#OpenInBrowser2()
    if has("macunix") && executable('open')
        let cmd = ":silent !open"
    elseif has("unix") && executable('xdg-open')
        let cmd = ":silent !xdg-open"
    elseif has("win64") && has("win32") || has("win32unix")
        let cmd = ':silent !start'
    elseif exists("$WSLENV")
        lcd /mnt/c
        let cmd = ":silent !cmd.exe /C start"
    else
        echohl Error
        echomsg "Can't find proper opener for an URL!"
        echohl None
        return
    endif

    " URL regexes
    let rx_base = '\%(\%(http\|ftp\|irc\)s\?\|file\)://\S'
    let rx_bare = rx_base . '\+'
    let rx_embd = rx_base . '\{-}'

    let URL = ""

    " markdown URL [link text](http://ya.ru 'yandex search')
    try
        let save_view = winsaveview()
        if searchpair('\[.\{-}\](', '', ')\zs', 'cbW', '', line('.')) > 0
            let URL = matchstr(getline('.')[col('.')-1:], '\[.\{-}\](\zs'.rx_embd.'\ze\(\s\+.\{-}\)\?)')
        endif
    finally
        call winrestview(save_view)
    endtry

    " asciidoc URL http://yandex.ru[yandex search]
    if empty(URL)
        try
            let save_view = winsaveview()
            if searchpair(rx_bare . '\[', '', '\]\zs', 'cbW', '', line('.')) > 0
                let URL = matchstr(getline('.')[col('.')-1:], '\S\{-}\ze[')
            endif
        finally
            call winrestview(save_view)
        endtry
    endif

    " HTML URL <a href='http://www.python.org'>Python is here</a>
    "          <a href="http://www.python.org"/>
    if empty(URL)
        try
            let save_view = winsaveview()
            if searchpair('<a\s\+href=', '', '\%(</a>\|/>\)\zs', 'cbW', '', line('.')) > 0
                let URL = matchstr(getline('.')[col('.')-1:], 'href=["'."'".']\?\zs\S\{-}\ze["'."'".']\?/\?>')
            endif
        finally
            call winrestview(save_view)
        endtry
    endif

    " barebone URL http://google.com
    if empty(URL)
        let URL = matchstr(expand("<cfile>"), rx_bare)
    endif

    if empty(URL)
        return
    endif

    exe cmd . ' "' . escape(URL, '#%!')  . '"'

    if exists("$WSLENV") | lcd - | endif
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
    let l:path = system("pfxc_file")
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
