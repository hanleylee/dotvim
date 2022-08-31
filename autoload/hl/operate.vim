" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" 使用分隔符连接多行
function hl#operate#join(sep, bang) range
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

" use `J` to merge to line
function! hl#operate#merge_line()
    let save_cursor = getcurpos()
    normal! J
    call setpos('.', save_cursor)
endfunction

function! hl#operate#revert_merge_line()
    let current_buffer_number = bufnr('%')
    let current_line_number = line('.')
    let current_line_content = getline(current_line_number)
    let next_line_number = current_line_number + 1
    let next_line_content = getline(next_line_number)

    let final_content = next_line_content . ' ' . current_line_content

    call setline(current_line_number, final_content)
    call deletebufline(current_buffer_number, next_line_number)
endfunction

" 移除行尾空格
function! hl#operate#remove_trailing_space() range
    execute 'keeppatterns:' . a:firstline . "," . a:lastline . 's/\s\+$//e'
endfun

function! hl#operate#remove_empty_line() range 
    execute a:firstline . ',' . a:lastline . 'g/^\s*$/d'
endfunction

" emebeded string with left_string and right_string(use 'normal!')
function! hl#operate#embedded_with_string_1(mode, left_str, right_str)
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

" emebeded string with left_string and right_string(use 'setline')
function! hl#operate#embedded_with_string_2(mode, left_str, right_str)
    let line_content = getline('.')
    let line_num = line('.')
    if a:mode ==# 'v'
        let begin_char_pos = getcharpos("'<")[2] - 1 " 使用 getcharpos 获得以 1 为增幅的字符的位置
        let end_char_pos = getcharpos("'>")[2] " 为什么 begin 位置需要 -1, 但是 end 不需要? 因为我们需要的是包裹, 包裹的位置在 begin 之前, 在 end 之后
    elseif a:mode ==# 'char'
        let begin_char_pos = getcharpos("'[")[2] - 1
        let end_char_pos = getcharpos("']")[2]
    else
        echoerr "not support mode!"
    endif

    let first_part = strcharpart(line_content, 0, begin_char_pos)
    let embedded_part = a:left_str . strcharpart(line_content, begin_char_pos, end_char_pos - begin_char_pos) . a:right_str
    let last_part = strcharpart(line_content, end_char_pos)

    let final_content = first_part . embedded_part . last_part
    call setline(line_num, final_content)
endfunction

" 对 JSON 数据进行转义
func! hl#operate#UnescapeJSON()
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
func! hl#operate#EscapeJSON()
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


" quick move any char to backward when cursor is behind that char in insert mode or on the char in normal mode
function! hl#operate#move_any_char_to_left() abort
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

" quick move bracket to backward when cursor is inside a pair of paris `(|)`
function! hl#operate#move_bracket_to_left() abort

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

function! hl#operate#append_text(text)
    let line_num = line('.')
    let final_text = hl#text#current_line_with_appending(a:text)

    call setline(line_num, final_text)
endfunction
