" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" Search all content use ag{{{
function! hl#fzf#ag_all(query, ...)
    let query = empty(a:query) ? '^(?=.)' : a:query
    return fzf#vim#ag_raw('--hidden ' . fzf#shellescape(query) . ' ' . getcwd())
endfunction
"}}}

" Search pattern across repository files{{{
function! hl#fzf#explore_current(...)
    let inpath = substitute(a:1, "'", '', 'g')
    if inpath == "" || matchend(inpath, '/') == strlen(inpath)
        execute "cd" getcwd() . '/' . inpath
        let cwpath = getcwd() . '/'
        call fzf#run(fzf#wrap(fzf#vim#with_preview({'source': 'ls -1ap', 'dir': cwpath, 'sink': 'FZFExplore', 'options': ['--prompt', cwpath]})))
    else
        let file = getcwd() . '/' . inpath
        execute "e" file
    endif
endfunction
"}}}
