" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" 目的: 用于将 markdown 文件复制到外界
" 作用: 将markdown 的多行在不影响布局的情况下合并为一段话
function! hl#markdown#merge_md()
    %s /\([\.\,]$\)\n\(\S\)/\1 \2/g
endfunction

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

" make markdown text bold
function! hl#markdown#make_bold(mode)
    call hl#embedded_with_string(a:mode, '**', '**')
endfunction

" make markdown text italic
function! hl#markdown#make_italic(mode)
    call hl#embedded_with_string(a:mode, '*', '*')
endfunction

" format chinese{{{
function! hl#markdown#Format() range
    " a:firstline,a:lastline call hl#Format_CN()
    execute a:firstline . "," . a:lastline . " call hl#Format_CN()"

    let regex_list = []
    " 包裹的 content 添加左右两侧空格
    " let regex_list = add(regex_list, '/\S\{-}\zs\s*\(`[^`]\+\n*[^`]\+`\)\s*\ze/ \1 /g')
    " let regex_list = add(regex_list, '/\%(^\|\S\{-1,}\zs\s*\)\(`[^`]\+\n*[^`]\+`\)\s*\ze/ \1 /g')

    " 清除行首为高亮行内代码的空格
    " let regex_list = add(regex_list, '/^ `/`/g')

    " 清除标点前的空格
    " let regex_list = add(regex_list, '/\(\S\)\s\+\([!;,.:?\])]\)/\1\2/g')
    " TODO: 移除本行, 恢复上一行
    let regex_list = add(regex_list, '/\(\S\)\s\+\([!;,\])]\)/\1\2/g')

    " 清除某些标点后(如 '(' '[' )的空格
    " let regex_list = add(regex_list, '/\([(\[]\)\s\+/\1/g')

    " 清除尾部空格
    let regex_list = add(regex_list, '/\s\+$//g')

    " 清空所有一行以上的空行
    let regex_list = add(regex_list, '/^\n$//g')

    " echom a:firstline
    " echom a:lastline
    for pattern in regex_list
        execute a:firstline . "," . a:lastline . " substitute " . pattern
    endfor

endfunction
"}}}

