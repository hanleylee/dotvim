" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" format chinese{{{
function! hl#Format_CN() range
    retab

    " let l = a:firstline
    " for line in getline(a:firstline, a:lastline)
    "     call setline(l, substitute(line, '，', ',', 'g'))
    "     let l = l + 1
    " endfor

    " /\S\s\+\([!;,.:?]\)/\1/g: 
    " /\([(\[]\)\s\+/\1/g: 
    "/^ `/`/g: 
    "/\([\u4e00-\u9fa5\u3040-\u30FF]\)\([a-zA-Z0-9@&=\[\$\%\^\-\+(\/\\]\)/\1 \2/g:
    "/\([a-zA-Z0-9!&;=\]\,\.\:\?\$\%\^\-\+\)\/\\]\)\([\u4e00-\u9fa5\u3040-\u30FF]\)/\1 \2/g:
    "/\s\+\n/\r/g: 

    " let regex_list = [
    "             \ '/，/, /g',
    "             \ '/。/. /g',
    "             \ '/：/: /g',
    "             \ ...
    "             \ ]

    let regex_list = []
    let regex_list = add(regex_list, '/，/, /g')
    let regex_list = add(regex_list, '/。/. /g')
    let regex_list = add(regex_list, '/：/: /g')
    let regex_list = add(regex_list, '/？/? /g')
    let regex_list = add(regex_list, '/；/; /g')
    let regex_list = add(regex_list, '/“\|”/"/g')
    let regex_list = add(regex_list, '/、/, /g')
    let regex_list = add(regex_list, '/（/(/g')
    let regex_list = add(regex_list, '/）/)/g')
    let regex_list = add(regex_list, '/！/!/g')
    let regex_list = add(regex_list, '/「/ **/g')
    let regex_list = add(regex_list, '/」/** /g')
    " 汉字在前, 英文/数字在后, 中间添加空格
    let regex_list = add(regex_list, '/\([\u4e00-\u9fa5\u3040-\u30FF]\)\([a-zA-Z0-9@&=\[\$\%\^\-\+(\/\\]\)/\1 \2/g')
    " 汉字在后, 英文/数字在前, 中间添加空格
    let regex_list = add(regex_list, '/\([a-zA-Z0-9!&;=\]\,\.\:\?\$\%\^\-\+\)\/\\]\)\([\u4e00-\u9fa5\u3040-\u30FF]\)/\1 \2/g')
    " 包裹的 content 添加左右两侧空格
    let regex_list = add(regex_list, '/[ ]*\(`[^`]\+`\)[ ]*/ \1 /g')
    " 清除标点前的空格
    let regex_list = add(regex_list, '/\(\S\)\s\+\([!;,.:?\])]\)/\1\2/g')
    " 清除某些标点后(如 '(' '[' )的空格
    let regex_list = add(regex_list, '/\([(\[]\)\s\+/\1/g')
    " 清除行首的空格
    let regex_list = add(regex_list, '/^ `/`/g')
    " 清除尾部空格
    let regex_list = add(regex_list, '/\s\+$//g')
    " 清空所有一行以上的空行
    let regex_list = add(regex_list, '/^\n$//g')

    for pattern in regex_list
        execute a:firstline . "," . a:lastline . " substitute " . pattern
    endfor

endfunction
"}}}

" replace surge rule {{{
function! s:ReplaceSurgeRule(key,val)
    let substitutedContent = substitute(a:val, ' =.*$', '', '')
    return substitutedContent
endfunction
"}}}

"{{{
function! hl#format_surge_rule() range
    let content = getline(a:firstline, a:lastline)

    let mapedLine = map(content, function('s:ReplaceSurgeRule'))
    let @0 = join(mapedLine, ',')
endfunction
"}}}

function! hl#format_objectmapper()
    retab!
    %s /\/\/.*\n//ge
    %s /^.* \(.*\):.*/    \1 <- map["\1"]/ge
endfunction

" 目的: 用于将 markdown 文件复制到外界
" 作用: 将markdown 的多行在不影响布局的情况下合并为一段话
function! hl#merge_md()
    %s /\([\.\,]$\)\n\(\S\)/\1 \2/g
endfunction

function! hl#merge_line()
    normal! mzJ`z
    execute 'delmarks z'
endfunction

function! hl#GrepOperator(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen
    let @@ = saved_unnamed_register
endfunction

if PlugLoaded('vim-surround')
    " make markdown text bold
    function! hl#MarkdownBold(mode)
        call hl#MarkdownEmphasis(a:mode, "bold")
    endfunction

    " make markdown text italic
    function! hl#MarkdownItalic(mode)
        call hl#MarkdownEmphasis(a:mode, "italic")
    endfunction

    " emphasis markdown text
    function! hl#MarkdownEmphasis(mode, emphasis_type)
        if a:emphasis_type ==# "italic"
            let emphasis_str = "S*"
        elseif a:emphasis_type ==# "bold"
            let emphasis_str = "S*gvS*"
        endif

        if a:mode ==# 'v'
            execute "normal `<v`>" . emphasis_str
        elseif a:mode ==# 'char'
            execute "normal `[v`]" . emphasis_str
        else
            return
        endif
    endfunction
endif

" format document
function! hl#format_document()
    if &filetype ==? 'markdown'
        execute "FormatCN"
    elseif &filetype ==? 'vim'
        execute "normal mzgg=G`zmz"
    elseif &filetype ==? 'csv'
        execute "%ArrangeColumn!"
    else
        execute "Autoformat"
    endif
endfunction

" 异步执行任务
function! hl#AsyncTask(mode)
    " if &filetype ==? 'vim'
    "     source %
    " else
    silent update | execute "AsyncTask " . a:mode
    " endif
endfunction

" 同步执行任务
function! hl#SyncTask()
    silent w
    if &filetype ==? 'c'
        "exec 'AsyncRun gcc % -o build/%< && ./build/%<' "花了一晚上研究出来的可用方案
        "exec 'AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/build/$(VIM_FILENOEXT)" && ./build/"$(VIM_FILENOEXT)"'
        " !gcc `pkg-config --cflags --libs glib-2.0` -Wall -O2 % -o "$XDG_CACHE_HOME/build/c/"%< && "$XDG_CACHE_HOME/build/c/"%<
        let target = expand('$XDG_CACHE_HOME/build/c/') . expand('%:t:r')
        exec '!clang % -o ' . target . " && " . target
    elseif &filetype ==? 'cpp'
        let target = expand('$XDG_CACHE_HOME/build/cpp/') . expand('%:t:r')
        exec '!clang++ -std=c++17 % -o ' . target . " && " . target
    elseif &filetype ==? 'java'
        !javac %; time java %<
    elseif &filetype ==? 'sh'
        !time bash %
    elseif &filetype ==? 'swift'
        let target = expand('$XDG_CACHE_HOME/build/swift/') . expand('%:t:r')
        !swiftc -o "$HOME/.cache/build/swift/$(VIM_FILENOEXT)" "$(VIM_FILEPATH)" && "$HOME/.cache/build/swift/$(VIM_FILENOEXT)"
        exec '!swiftc % -o ' . target . " && " . target
    elseif &filetype ==? 'python'
        !time python3 %
    elseif &filetype ==? 'html'
        silent !open %
    elseif &filetype ==? 'xhtml'
        silent !open %
    elseif &filetype ==? 'go'
        !go build %<; time go run %
    else
        echom 'Current filetype is not supported!'
    endif

endfunction

function! hl#CloseAll() abort
    let term_bufs = filter(range(1, bufnr('$')), 'getbufvar(v:val, "&buftype") == "terminal"')
    for term_num in term_bufs
        execute "bd! " . term_num
    endfor
    xa
endfunction
