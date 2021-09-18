" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" show document{{{
function! hl#coc#show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction
"}}}

" function! s:check_back_space() abort
"     let col = col('.') - 1
"     return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" insert map for enter{{{
function! hl#coc#insert_map_for_enter()
    if pumvisible()
        " return coc#_select_confirm()
        return "\<C-y>"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
        return "\<C-g>u\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction
"}}}

" highlight current cursor{{{
function hl#coc#highlight_current_cursor()
    let ft = &filetype
    if ft !=? 'markdown' 
                \ && ft !=? 'csv'
                \ && ft !=? 'txt'
        call CocActionAsync('highlight')
    endif
endfunction
"}}}