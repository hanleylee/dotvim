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
    normal! $
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
    call hl#operate#embedded_with_string_2(a:mode, '**', '**')
endfunction

" make markdown text italic
function! hl#markdown#make_italic(mode)
    call hl#operate#embedded_with_string_2(a:mode, '*', '*')
endfunction

" format chinese{{{
function! hl#markdown#Format() range
    " a:firstline,a:lastline call hl#Format_CN()
    execute a:firstline . "," . a:lastline . " call hl#format_cn()"

    let regex_list = []
    " 包裹的 content 添加左右两侧空格
    " let regex_list = add(regex_list, '/\S\{-}\zs\s*\(`[^`]\+\n*[^`]\+`\)\s*\ze/ \1 /g')
    " let regex_list = add(regex_list, '/\%(^\|\S\{-1,}\zs\s*\)\(`[^`]\+\n*[^`]\+`\)\s*\ze/ \1 /g')

    " 1. 为 inline code 添加左右空格
    " - \([^`]\|^\): 以非 ` 开头或 行首 开头
    " - \zs ... \ze: 真正要进行替换的起点与终点
    " - \s*\(`[^`]\_.\{-0,}`\)\s*: \_.\{-0,} 跨行代表非贪婪匹配, 整体含义为匹配以 ` 开头以 ` 结尾, 且内容为非 ` 字符必须超过一个的任意多个字符
    let regex_list = add(regex_list, '/\([^`]\|^\)\zs\s*\(`[^`]\_.\{-0,}`\)\s*\ze/ \2 /g')

    " 2. 清除由 1 造成的副作用(行首单空格)
    let regex_list = add(regex_list, '/^\s`/`/g')

    " 2. 清除由 1 造成的副作用(左括号后空格)
    let regex_list = add(regex_list, '/(\zs\s`/`/g')

    " 3. 清除标点前的空格
    let regex_list = add(regex_list, '/\(\S\)\s\+\([:;,.\])]\)/\1\2/g')

    " 4. 清除某些标点后(如 '(' '[' )的空格
    " let regex_list = add(regex_list, '/\([(\[]\)\s\+/\1/g')

    " 5. 清除尾部空格
    let regex_list = add(regex_list, '/\s\+$//g')

    " 6. 清空所有一行以上的空行
    let regex_list = add(regex_list, '/^\n$//g')

    " echom a:firstline
    " echom a:lastline
    for pattern in regex_list
        execute a:firstline . "," . a:lastline . " substitute " . pattern
    endfor

endfunction
"}}}

