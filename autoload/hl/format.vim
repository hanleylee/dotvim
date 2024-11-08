" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" format document
function! hl#format#document(mode) range
    if a:mode == 'n'
        let range = '%'
    elseif a:mode == 'v'
        let range = a:firstline . ',' . a:lastline
    endif
    if &filetype ==? 'markdown'
        execute range . "FormatMarkdown"
    elseif &filetype ==? 'vim'
        call hl#format#reindent_document()
    elseif &filetype ==? 'csv'
        execute range . "ArrangeColumn!"
    else
        execute range . "Autoformat"
    endif
endfunction

function! hl#format#reindent_document()
    let v = winsaveview()
    keepjumps normal! gg=G
    call winrestview(v)
endfunction

function! hl#format#cn() range
    let regex_list = []
    let regex_list = add(regex_list, '/，/, /g')
    let regex_list = add(regex_list, '/。/. /g')
    let regex_list = add(regex_list, '/：/: /g')
    let regex_list = add(regex_list, '/？/? /g')
    let regex_list = add(regex_list, '/；/; /g')
    let regex_list = add(regex_list, '/“\|”/"/g')
    let regex_list = add(regex_list, "/‘\\|’/'/g") " => /‘\|’/'/g
    let regex_list = add(regex_list, '/、/, /g')
    let regex_list = add(regex_list, '/（/(/g')
    let regex_list = add(regex_list, '/）/)/g')
    let regex_list = add(regex_list, '/！/!/g')
    let regex_list = add(regex_list, '/「/ **/g')
    let regex_list = add(regex_list, '/」/** /g')

    " 汉字在前, 英文/数字在后, 中间添加空格
    let regex_list = add(regex_list, '/\([\u4e00-\u9fff\u3040-\u30FF]\)\([a-zA-Z0-9@&=\[\$\%\^\-\+(\/\\]\)/\1 \2/g')

    " 英文/数字在前, 汉字在后, 中间添加空格
    let regex_list = add(regex_list, '/\([a-zA-Z0-9!&;=\]\,\.\:\?\$\%\^\-\+\)\/\\]\)\([\u4e00-\u9fff\u3040-\u30FF]\)/\1 \2/g')

    for pattern in regex_list
        execute a:firstline . "," . a:lastline . " substitute " . pattern
    endfor
endfunction

"{{{
function! hl#format#objectmapper()
    retab!
    %s /\/\/.*\n//ge
    %s /^.* \(.*\):.*/    \1 <- map["\1"]/ge
endfunction
"}}}
