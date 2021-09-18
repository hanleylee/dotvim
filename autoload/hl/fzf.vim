" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" https://github.com/junegunn/fzf/blob/master/README-VIM.md
" https://github.com/junegunn/fzf/wiki/Examples-(vim)#delete-buffers-from-buffers

" Global options supported by fzf#wrap

" - g:fzf_layout
" - g:fzf_action
"   Works only when no custom sink (or sinklist) is provided
"   Having custom sink usually means that each entry is not an ordinary file path (e.g. name of color scheme), so we can't blindly apply the same
"   strategy (i.e. tabedit some-color-scheme doesn't make sense)
" - g:fzf_colors
" - g:fzf_history_dir

"
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



function! hl#fzf#statusline_theme()
    " Override statusline as you like
    highlight fzf1 ctermfg=161 ctermbg=251
    highlight fzf2 ctermfg=23 ctermbg=251
    highlight fzf3 ctermfg=237 ctermbg=251
    setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction


