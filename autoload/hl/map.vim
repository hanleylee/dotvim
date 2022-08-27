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

function! hl#map#ctrl_enter(keep_comment)
    call coc#pum#close('cancel')
    " " 如果当前光标已经位于行首了, 那么 c-u 会删除到上一行, 因此我们要针对有缩进的和没有缩进的进行区分
    " if hl#get#indent_level() > 0
    "     return "\<CR>\<C-u>"
    " else
    "     return "\<CR>"
    " endif
    if a:keep_comment
        if hl#get#is_current_comment()
            return "\<CR>\<C-u>"
        else
            return "\<CR>"
        endif
    else
            return "\<CR>"
    endif
endfunction
"}}}

