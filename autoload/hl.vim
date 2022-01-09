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
    if a:direction ==# 'u'
        let scroll_lines = -20
        let scroll_direction = 0
    elseif a:direction ==# 'd'
        let scroll_lines = 20
        let scroll_direction = 1
    elseif a:direction ==# 'k'
        let scroll_lines = -1
        let scroll_direction = 0
    elseif a:direction ==# 'j'
        let scroll_lines = 1
        let scroll_direction = 1
    endif
    " if a:direction ==# 'u'
        if hl#plug_loaded('coc.nvim') && coc#float#has_scroll() 
            call coc#float#scroll(scroll_direction, abs(scroll_lines))
        elseif hl#plug_loaded('vim-quickui')
            call quickui#preview#scroll(scroll_lines)
        endif
    " elseif a:direction ==# 'd'
    "     if hl#plug_loaded('coc.nvim') && coc#float#has_scroll() 
    "         call coc#float#scroll(1, scroll_lines)
    "     elseif hl#plug_loaded('vim-quickui')
    "         call quickui#preview#scroll(scroll_lines)
    "     endif
    " endif
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

function! hl#format_cn() range
    echom a:firstline
    echom a:lastline

    let regex_list = []
    let regex_list = add(regex_list, '/，/, /g')
    let regex_list = add(regex_list, '/。/. /g')
    let regex_list = add(regex_list, '/：/: /g')
    let regex_list = add(regex_list, '/？/? /g')
    let regex_list = add(regex_list, '/；/; /g')
    let regex_list = add(regex_list, '/“\|”\|‘\|’/"/g')
    let regex_list = add(regex_list, '/、/, /g')
    let regex_list = add(regex_list, '/（/(/g')
    let regex_list = add(regex_list, '/）/)/g')
    let regex_list = add(regex_list, '/！/!/g')
    let regex_list = add(regex_list, '/「/ **/g')
    let regex_list = add(regex_list, '/」/** /g')

    " 汉字在前, 英文/数字在后, 中间添加空格
    let regex_list = add(regex_list, '/\([\u4e00-\u9fa5\u3040-\u30FF]\)\([a-zA-Z0-9@&=\[\$\%\^\-\+(\/\\]\)/\1 \2/g')

    " 英文/数字在前, 汉字在后, 中间添加空格
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

function! hl#reindent_document()
    " execute "normal mzgg=G`zmz"
    let v = winsaveview()
    keepjumps normal! gg=G
    call winrestview(v)
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
        call hl#reindent_document()
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

function! hl#Get_titlestr() abort
    let l:title_str = ''
    if g:is_linux
        let l:title_str = hostname() . '  '
    endif
    let l:title_str = l:title_str . expand('%:p:~') . '  '
    if &buflisted
        let l:title_str = l:title_str . strftime('%Y-%m-%d %H:%M',getftime(expand('%')))
    endif

    return l:title_str
endfunction

" Output current time or unix timestamp in human-readable format.
function! hl#iso_time(timestamp) abort
    if a:timestamp
        return strftime('%Y-%m-%d %H:%M:%S%z', a:timestamp)
    endif

    return strftime('%Y-%m-%d %H:%M:%S%z')
endfunction

function! hl#GetGitBranch()
    let l:res = systemlist('git rev-parse --abbrev-ref HEAD')[0]
    if match(l:res, 'fatal') != -1
        return ''
    else
        return l:res
    endif
endfunction

function hl#LoadTemplate(read)
    " read 指示是新文件还是在读取文件
    " 1: new file
    " 2: current file

    " 另作处理的文件类型
    if expand("%:t") =~ '\.h$'
        return
    endif

    if g:is_win
        let templatePrefix = '$VIM/vimfiles/templates/template.'
    else
        let templatePrefix = '~/.vim/templates/template.'
    endif
    let fname = templatePrefix . &ft
    let fname = expand(fname)

    if !filereadable(fname)
        return
    endif

    if a:read == 0 
        sil exe 'keepalt read ' . fname
        " 删除空行
        normal ggdd
        setlocal nomodified
    else
        echom fname
        sil exe 'tabedit '. fname
    endif
endfunction

" 复制缓冲区到新标签页
function hl#copy_to_newtab()
  let temp = tempname()
  try
    let nr = bufnr('%')
    exec "mkview" temp
    tabnew
    silent exec "source" temp
  finally
    call delete(temp)
  endtry
endfunction

" 删除所有未显示且无修改的缓冲区以减少内存占用
function hl#clean_bufs()
  for bufNr in filter(range(1, bufnr('$')),
        \ 'buflisted(v:val) && !bufloaded(v:val)')
    execute bufNr . 'bdelete'
  endfor
endfunction

" 获取可读的文件大小
function hl#getfsize(file)
  let size = getfsize(a:file)
  if has('python3')
    try
      py3 from myutils import filesize
      return py3eval('filesize('.size.')')
    catch /.*/
    endtry
  endif
  return size . 'B'
endfunction

" 使用分隔符连接多行
function hl#join(sep, bang) range
  if a:sep[0] == '\'
    let sep = strpart(a:sep, 1)
  else
    let sep = a:sep
  endif
  let lines = getline(a:firstline, a:lastline)
  if a:firstline == 1 && a:lastline == line('$')
    let dellast = 1
  else
    let dellast = 0
  endif
  exe a:firstline . ',' . a:lastline . 'd_'
  if a:bang != '!'
    call map(lines, "substitute(v:val, '^\\s\\+\\|\\s\\+$', '', 'g')")
  endif
  call append(a:firstline-1, join(lines, sep))
  if dellast
    $d_
  endif
endfunction

" 切换显示行号/相对行号/不显示
function hl#toggle_number()
  if &nu && &rnu
    set nonu nornu
  elseif &nu && !&rnu
    set rnu
  else
    set nu
  endif
endfunction

" 将当前窗口置于屏幕中间(全屏时用)
function hl#center_full()
  on
  vs
  ene
  setl nocul
  setl nonu
  40winc |
  winc l
  vs
  winc l
  ene
  setl nocul
  setl nonu
  40winc |
  winc h
  redr!
endfunction

" 返回当前日期的中文表示
function hl#zh_date()
  let d = strftime("%Y年%m月%d日")
  let d = substitute(d, '[年月]\@<=0', '', 'g')
  return d
endfunction

function hl#close_win(winnr)
  let winnum = bufwinnr(a:winnr)
  if winnum == -1
    return 0
  endif
  " Goto the workspace window, close it and then come back to the
  " original window
  let curbufnr = bufnr('%')
  exe winnum . 'wincmd w'
  close
  " Need to jump back to the original window only if we are not
  " already in that window
  let winnum = bufwinnr(curbufnr)
  if winnr() != winnum
    exe winnum . 'wincmd w'
  endif
  return 1
endfunction

" insert map for ctrl-enter{{{
function! hl#insert_map_for_ctrl_enter()
    let current_syntax = synIDattr(synIDtrans(synID(line("."), col("$")-1, 1)), "name")
    " let current_indent_size = indent('.')
    if current_syntax ==? 'Comment'
        return "\<C-g>u\<CR>\<C-u>"
    else
        return "\<C-g>u\<CR>"
    endif
endfunction
"}}}

" show document{{{
function! hl#show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction
"}}}

