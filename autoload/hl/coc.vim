" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

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

function! hl#coc#disable_for_type()
  " if index(g:coc_filetypes_enable, &filetype) == -1
  "   :silent! CocDisable
  " else
  "   :silent! CocEnable
  " endif
  	if index(g:coc_disable_file_types, &filetype) != -1
        let b:coc_enabled = 0
    endif
endfunction

function! hl#coc#disable_for_large_file()
    let total_line = line('$')
    let total_column = col('$')

    if (total_line > g:coc_max_acceptable_line) || (total_column > g:coc_max_acceptable_column)
        let b:coc_enabled = 0
    endif
endfunction
