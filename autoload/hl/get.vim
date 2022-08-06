" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

function! hl#get#titlestr() abort
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
function! hl#get#iso_time(timestamp) abort
    if a:timestamp
        return strftime('%Y-%m-%d %H:%M:%S%z', a:timestamp)
    endif

    return strftime('%Y-%m-%d %H:%M:%S%z')
endfunction

function! hl#get#GitBranch()
    let l:res = systemlist('git rev-parse --abbrev-ref HEAD')[0]
    if match(l:res, 'fatal') != -1
        return ''
    else
        return l:res
    endif
endfunction

" 获取可读的文件大小
function hl#get#fsize(file)
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

func hl#get#indent_level()
    return indent('.') / &shiftwidth
endfunction

" 返回当前日期的中文表示
function hl#get#zh_date()
  let d = strftime("%Y年%m月%d日")
  let d = substitute(d, '[年月]\@<=0', '', 'g')
  return d
endfunction

