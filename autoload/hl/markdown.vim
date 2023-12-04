" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" 目的: 用于将 markdown 文件复制到外界
" 作用: 将markdown 的多行在不影响布局的情况下合并为一段话
function! hl#markdown#merge_md()
    %s /\([\.\,]$\)\n\(\S\)/\1 \2/g
endfunction

" mark markdown text bold
function! hl#markdown#mark_bold(mode)
    call hl#operate#embedded_with_string_2(a:mode, '**', '**')
endfunction

function! hl#markdown#extract_bold()
    " call hl#operate#extract_with_string('\*\*', '\*\*')
    normal ds*ds*
    call repeat#set(":call hl#markdown#extract_bold()\<CR>")
endfunction

" mark markdown text italic
function! hl#markdown#mark_italic(mode)
    call hl#operate#embedded_with_string_2(a:mode, '*', '*')
endfunction

" mark markdown text code
function! hl#markdown#mark_code(mode)
    call hl#operate#embedded_with_string_2(a:mode, '`', '`')
endfunction

" mark markdown text deleted
function! hl#markdown#mark_deleted(mode)
    call hl#operate#embedded_with_string_2(a:mode, '~~', '~~')
endfunction

function! hl#markdown#extract_deleted()
    " call hl#operate#extract_with_string('\*\*', '\*\*')
    normal ds~ds~
    call repeat#set(":call hl#markdown#extract_deleted()\<CR>")
endfunction

" convert '   moon                   # Moon phase' to '- `moon`: Moon phase'
function! hl#markdown#convert_hash_key_to_list()
    let current_line_num = line('.')
    let current_line_content = getline(current_line_num)
    let first_part_str = matchstr(current_line_content, '\s*\zs.\{-}\ze\s*\(#\|$\)')
    let second_part_str = matchstr(current_line_content, '.*#\s*\zs.\{-}\ze\s*$')
    if empty(second_part_str)
        let final_content = '- `' . first_part_str . '`'
    else
        let final_content = '- `' . first_part_str . '`: ' . second_part_str
    endif
    call setline(current_line_num, final_content)
endfunction

" format chinese{{{
function! hl#markdown#format() range
    " a:firstline,a:lastline call hl#Format_CN()
    " execute a:firstline . "," . a:lastline . " call hl#format#cn()"

    let regex_list = []
    " 包裹的 content 添加左右两侧空格
    " let regex_list = add(regex_list, '/\S\{-}\zs\s*\(`[^`]\+\n*[^`]\+`\)\s*\ze/ \1 /g')
    " let regex_list = add(regex_list, '/\%(^\|\S\{-1,}\zs\s*\)\(`[^`]\+\n*[^`]\+`\)\s*\ze/ \1 /g')

    " 1. 为 inline code 添加左右空格
    " - \([^`]\|^\): 以非 ` 开头或 行首 开头
    " - \zs ... \ze: 真正要进行替换的起点与终点
    " - \s*\(`[^`]\_.\{-0,}`\)\s*: \_.\{-0,} 跨行代表非贪婪匹配, 整体含义为匹配以 ` 开头以 ` 结尾, 且内容为非 ` 字符必须超过一个的任意多个字符
    " let regex_list = add(regex_list, '/\([^`]\|^\)\zs\s*\(`[^`]\_.\{-0,}`\)\s*\ze/ \2 /g')

    " 2. 清除由 1 造成的副作用(行首单空格)
    " let regex_list = add(regex_list, '/^\s`/`/g')

    " 2. 清除由 1 造成的副作用(左括号后空格)
    " let regex_list = add(regex_list, '/(\zs\s`/`/g')

    " 3. 清除标点前的空格
    let regex_list = add(regex_list, '/\(\S\)\s\+\([:;,.\])]\)/\1\2/g')

    " 4. 清除某些标点后(如 '(' '[' )的空格
    " let regex_list = add(regex_list, '/\([(\[]\)\s\+/\1/g')

    " 5. 清除尾部空格
    let regex_list = add(regex_list, '/\s\+$//g')

    " 6. 清空所有一行以上的空行
    let regex_list = add(regex_list, '/^\n$//g')

    for line_num in range(a:firstline, a:lastline)
        let cursor_syntax = map(synstack(line_num, 1), 'synIDattr(v:val,"name")')
        " 如果是 codeBlock 内容则不进行格式化
        let isCodeBlock = indexof(cursor_syntax, { e -> match(v:val, 'mkdSnippet') >= 0 }) >= 0
        " echom 'isCodeBlock: ' . isCodeBlock .  'line_num: ' . line_num . 'syntax: ' . join(cursor_syntax, ',')
        if !isCodeBlock
            execute line_num . " call hl#format#cn()"
            for pattern in regex_list
                execute line_num . " substitute " . pattern
            endfor
        endif
    endfor

endfunction
"}}}

