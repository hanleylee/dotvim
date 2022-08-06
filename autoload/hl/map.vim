" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" insert map for enter{{{
function! hl#map#enter()
    " if pumvisible()
    if coc#pum#visible()
        return coc#pum#confirm()
        " return "\<C-y>"
    elseif strcharpart(getline('.'),getpos('.')[2]-1,1) == '}'
        return "\<C-g>u\<CR>\<Esc>O"
    else
        return "\<CR>"
    endif
endfunction
"}}}

" insert map for ctrl-enter{{{
function! hl#map#ctrl_enter()
    " 如果当前光标已经位于行首了, 那么 c-u 会删除到上一行, 因此我们要针对有缩进的和没有缩进的进行区分
    if hl#get#indent_level() > 0
        return "\<C-g>u\<CR>\<C-u>"
    else
        return "\<C-g>u\<CR>"
    endif
    " let current_syntax = synIDattr(synIDtrans(synID(line("."), col("$")-1, 1)), "name")
    " if current_syntax ==? 'Comment'
    "     return "\<C-g>u\<CR>\<C-u>"
    " else
    "     return "\<C-g>u\<CR>"
    " endif
endfunction
"}}}

