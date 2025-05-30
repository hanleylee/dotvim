" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

let total_line = line('$')
if (total_line < 100000)
    setlocal foldmethod=syntax
endif
" nmap <silent><buffer> <S-Tab> zA

command! -range=% -nargs=0 -buffer RemoveComment let s:view = winsaveview() | silent! <line1>,<line2> call hl#json#RemoveComment() | call winrestview(s:view)

command! -range=% -nargs=0 -buffer CompactJSON  silent <line1>,<line2> !jq -c
command! -range=% -nargs=0 -buffer MinifyJSON   silent <line1>,<line2> !jq -c

command! -range=% -nargs=0 -buffer FormatJSON   silent <line1>,<line2> !jq --indent 4
command! -range=% -nargs=0 -buffer PrettifyJSON silent <line1>,<line2> !jq --indent 4
