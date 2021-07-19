" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('fzf.vim')
    finish
endif

" Search all content use ag
function! fzf#ag_all(query, ...)
    let query = empty(a:query) ? '^(?=.)' : a:query
    return fzf#vim#ag_raw('--hidden '.fzf#shellescape(query).' '.getcwd())
endfunction
