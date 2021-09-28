" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

function! hl#markdown#CodeBlockTextObj(type) abort
    " the parameter type specify whether it is inner text objects or arround text objects.
    let start_row = searchpos('\s*```', 'bn')[0]
    let end_row = searchpos('\s*```', 'n')[0]

    let buf_num = bufnr()
    if a:type ==# 'i'
        let start_row += 1
        let end_row -= 1
    endif
    " echo a:type start_row end_row

    call setpos("'<", [buf_num, start_row, 1, 0])
    call setpos("'>", [buf_num, end_row, 1, 0])
    execute 'normal! `<V`>'
endfunction

