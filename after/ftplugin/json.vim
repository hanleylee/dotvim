" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

let total_line = line('$')
if (total_line < 100000)
    setlocal foldmethod=syntax
endif
" nmap <silent><buffer> <S-Tab> zA

command! -range=% -nargs=0 -buffer RemoveComment let b:view = winsaveview() | silent! <line1>,<line2> call hl#json#RemoveComment() | call winrestview(b:view)
