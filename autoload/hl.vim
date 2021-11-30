" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" 是否加载了 plug{{{
function! hl#plug_loaded(name)
    if !exists('g:plugs')
        return 0
    else
        return has_key(g:plugs, a:name)
    endif
endfunction
"}}}

" 获得上次选中区域的内容
function! hl#visual_selection() abort
    try
        let a_save = @a
        silent! normal! gv"ay
        return @a
    finally
        let @a = a_save
    endtry
endfunction

" 使 preview 窗口滚动, 比如 coc.nvim 或者 vim-quickui
function! hl#preview_scroll(direction)
    let scroll_lines = 20
    if a:direction ==# 'u'
        if hl#plug_loaded('coc.nvim') && coc#float#has_scroll() 
            call coc#float#scroll(0, scroll_lines)
        elseif hl#plug_loaded('vim-quickui')
            call quickui#preview#scroll(-scroll_lines)
        endif
    elseif a:direction ==# 'd'
        if hl#plug_loaded('coc.nvim') && coc#float#has_scroll() 
            call coc#float#scroll(1, scroll_lines)
        elseif hl#plug_loaded('vim-quickui')
            call quickui#preview#scroll(scroll_lines)
        endif
    endif
endfunction

" quick move bracket to backward when cursor is inside a pair of paris `(|)`
function! hl#move_bracket_to_left() abort

    let is_insert = mode() == 'i'
    let current_pos = getpos('.')
    " 是否为第一次在这个位置
    let is_first_time_this_postion = current_pos != get(b:, 'assist_move_bracket_pos', [])
    if is_first_time_this_postion " 如果是第一次, 那么就寻找左侧括号进行移动
        let bracket_arr = ['{', '[', '(']
        let current_char_shift = is_insert ? 2 : 1
        let current_char = getline('.')[col('.') - current_char_shift]
        let is_in_left_bracket = index(bracket_arr, current_char) >= 0
        if is_in_left_bracket " 如果已经在左括号上了, 那么就不需要跳转了
            let opeart = 'm`xbP``'
        else " 如果没有在左括号上, 那么要跳到左括号上
            let opeart = 'm`%xbP``'
        endif
    else " 如果不是第一次, 那么就寻找上次移动的那个位置, 再次递进左移
        let opeart = 'm``.xbP``'
    endif

    let b:assist_move_bracket_pos = current_pos

    let prefix = is_insert ? "\<Esc>" : ''
    let suffix = is_insert ? 'a' : ''

    return prefix . opeart . suffix
endfunction

" quick move any char to backward when cursor is behind that char in insert mode or on the char in normal mode
function! hl#move_any_char_to_left() abort

    let is_insert = mode() == 'i'
    let current_pos = getpos('.')
    " 是否为第一次在这个位置
    let is_first_time_this_postion = current_pos != get(b:, 'assist_move_any_char_pos', [])
    if is_first_time_this_postion " 如果是第一次, 那么就寻找左侧括号进行移动
        let current_char_shift = is_insert ? 2 : 1
        let current_char = getline('.')[col('.') - current_char_shift]
        let opeart = 'm`xbP``'
    else " 如果不是第一次, 那么就寻找上次移动的那个位置, 再次递进左移
        let opeart = 'm``.xbP``'
    endif

    let b:assist_move_any_char_pos = current_pos

    let prefix = is_insert ? "\<Esc>" : ''
    let suffix = is_insert ? 'a' : ''

    return prefix . opeart . suffix
endfunction

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

"{{{
function! hl#format_objectmapper()
    retab!
    %s /\/\/.*\n//ge
    %s /^.* \(.*\):.*/    \1 <- map["\1"]/ge
endfunction
"}}}

function! hl#Format_CN() range
    echom a:firstline
    echom a:lastline

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

    for pattern in regex_list
        execute a:firstline . "," . a:lastline . " substitute " . pattern
    endfor
endfunction

" use `J` to merge to line
function! hl#merge_line()
    normal! mzJ`z
    execute 'delmarks z'
endfunction

function! hl#grep_operator(type)
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

" emebeded string with left_string and right_string
function! hl#embedded_with_string(mode, left_str, right_str)
    if a:mode ==# 'v'
        execute 'normal `>a' . a:right_str . "\<ESC>`<" . 'i' . a:left_str . "\<ESC>"
    elseif a:mode ==# 'char'
        " execute 'normal `]a' . a:right_str . "\<ESC>`[" . 'i' . a:left_str . "\<ESC>"
        " execute "normal `[v`]" . 'S*'
        execute "normal `[v`]\<ESC>`" . '>a' . a:right_str . "\<ESC>`<" . 'i' . a:left_str . "\<ESC>"
    else
        return
    endif
endfunction

" format document
function! hl#format_document(mode) range
    if &filetype ==? 'markdown'
        if a:mode == 'n'
            let range = '%'
        elseif a:mode == 'v'
            let range = a:firstline . ',' . a:lastline
        endif
        execute range . "FormatMarkdown"
    elseif &filetype ==? 'vim'
        execute "normal mzgg=G`zmz"
    elseif &filetype ==? 'csv'
        execute "%ArrangeColumn!"
    else
        execute "Autoformat"
    endif
endfunction

" 异步执行任务
function! hl#async_task(mode)
    let filename = expand('%:t')
    if filename ==# 'Podfile'
        silent update | execute 'PodUpdateNoRepoUpdate'
    elseif &filetype ==? 'vim'
        silent update | source %
    else
        " execute "AsyncTask " . a:mode
        silent update | execute 'AsyncTask ' . a:mode
    endif
endfunction

" 同步执行任务
function! hl#sync_task()
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

" close all window, specially for vim {{{
function! hl#close_all() abort
    let term_bufs = filter(range(1, bufnr('$')), 'getbufvar(v:val, "&buftype") == "terminal"')
    for term_num in term_bufs
        execute "bd! " . term_num
    endfor
    xa
endfunction

function! hl#try_set_dictionary()
    let dict_path = "~/.vim/dict/" . &filetype . '.dict'
    if filereadable(expand(dict_path))
        execute 'setlocal dict+=' . dict_path
    endif
endfunction
"}}}
