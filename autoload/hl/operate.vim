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
    normal! mzJ`z
    execute 'delmarks z'
endfunction

" emebeded string with left_string and right_string
function! hl#operate#embedded_with_string(mode, left_str, right_str)
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

" 移除行尾空格
function! hl#operate#TrimTrailingWhitespace()
    let l:save = winsaveview() " 保存当前 window 状态 (光标位置等)
    keeppatterns %s/\s\+$//e " 不添加到查找历史记录中
    call winrestview(l:save) " 恢复 window 窗口状态
endfun

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

