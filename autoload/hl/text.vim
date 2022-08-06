" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" get formatted url string, return '' if it isn't url link
function! hl#text#url_formatted_string(string)
    " 确保 uri 中含有 '.', 且不以引号开头结尾
    let uri = matchstr(a:string, "[a-z]*:\/\/[^ >,;()']*")
    let uri = substitute(uri, '?', '\\?', '')
    let uri = shellescape(uri, 1)
    return uri
endfunction

" get visual mode selected text
" Why is this not a built-in Vim script function?!
function! hl#text#visual_selection()
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

" get visual mode selected text 2
" alternative to above
function! hl#text#visual_selection2()
    try
        let a_save = @a
        normal! gv"ay
        return @a
    finally
        let @a = a_save
    endtry
endfunction

" url encode
function! hl#text#url_encode(str) abort
    " iconv trick to convert utf-8 bytes to 8bits indiviual char.
    return substitute(iconv(a:str, 'latin1', 'utf-8'),'[^A-Za-z0-9_.~-]','\="%".printf("%02X",char2nr(submatch(0)))','g')
endfunction

" url decode
function! hl#text#url_decode(str) abort
    let str = substitute(substitute(substitute(a:str,'%0[Aa]\n$','%0A',''),'%0[Aa]','\n','g'),'+',' ','g')
    return iconv(substitute(str,'%\(\x\x\)','\=nr2char("0x".submatch(1))','g'), 'utf-8', 'latin1')
endfunction

function! hl#text#string_encode(str) abort
    let map = {"\n": 'n', "\r": 'r', "\t": 't', "\b": 'b', "\f": '\f', '"': '"', '\': '\'}
    return substitute(a:str,"[\001-\033\\\\\"]",'\="\\".get(map,submatch(0),printf("%03o",char2nr(submatch(0))))','g')
endfunction

function! hl#text#string_decode(str) abort
    let map = {'n': "\n", 'r': "\r", 't': "\t", 'b': "\b", 'f': "\f", 'e': "\e", 'a': "\001", 'v': "\013", "\n": ''}
    let str = a:str
    if str =~# '^\s*".\{-\}\\\@<!\%(\\\\\)*"\s*\n\=$'
        let str = substitute(substitute(str,'^\s*\zs"','',''),'"\ze\s*\n\=$','','')
    endif
    return substitute(str,'\\\(\o\{1,3\}\|x\x\{1,2\}\|u\x\{1,4\}\|.\)','\=get(map,submatch(1),submatch(1) =~? "^[0-9xu]" ? nr2char("0".substitute(submatch(1),"^[Uu]","x","")) : submatch(1))','g')
endfunction

function! hl#text#xml_decode(str) abort
    let str = substitute(a:str,'<\%([[:alnum:]-]\+=\%("[^"]*"\|''[^'']*''\)\|.\)\{-\}>','','g')
    return s:xml_entity_decode(str)
endfunction

function! hl#text#xml_encode(str) abort
    let str = a:str
    let str = substitute(str,'&','\&amp;','g')
    let str = substitute(str,'<','\&lt;','g')
    let str = substitute(str,'>','\&gt;','g')
    let str = substitute(str,'"','\&quot;','g')
    let str = substitute(str,"'",'\&apos;','g')
    return str
endfunction

" replace surge rule {{{
function! s:ReplaceSurgeRule(key,val)
    let substitutedContent = substitute(a:val, ' =.*$', '', '')
    return substitutedContent
endfunction
"}}}

"{{{
function! hl#text#format_surge_rule() range
    let content = getline(a:firstline, a:lastline)

    let mapedLine = map(content, function('s:ReplaceSurgeRule'))
    let @0 = join(mapedLine, ',')
endfunction
"}}}

" quick move bracket to backward when cursor is inside a pair of paris `(|)`
function! hl#text#move_bracket_to_left() abort

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
function! hl#text#move_any_char_to_left() abort

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
