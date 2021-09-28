" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

setlocal conceallevel=2
" setlocal textwidth=0
" setlocal foldmethod=expr

noremap <silent><buffer> j   gj
noremap <silent><buffer> k   gk
noremap <silent><buffer> gj  j
noremap <silent><buffer> gk  k

" undo break points
inoremap <buffer> , ,<C-g>u
inoremap <buffer> . .<C-g>u
inoremap <buffer> ! !<C-g>u
inoremap <buffer> ? ?<C-g>u

" jumplist mutations
nnoremap <buffer> <expr> k (v:count > 5 ? "m'" . v:count : "") . 'gk'
nnoremap <buffer> <expr> j (v:count > 5 ? "m'" . v:count : "") . 'gj'

" make bold
vmap <buffer> <Leader>/ :<c-u>call hl#MarkdownItalic(visualmode())<cr>
nmap <buffer> <Leader>/ :set operatorfunc=hl#MarkdownItalic<cr>g@
vmap <buffer> <Leader>b :<c-u>call hl#MarkdownBold(visualmode())<cr>
nmap <buffer> <Leader>b :set operatorfunc=hl#MarkdownBold<cr>g@

" text object for code block
vnoremap <buffer> <silent> ic :<C-U>call hl#markdown#CodeBlockTextObj('i')<CR>
onoremap <buffer> <silent> ic :<C-U>call hl#markdown#CodeBlockTextObj('i')<CR>
vnoremap <buffer> <silent> ac :<C-U>call hl#markdown#CodeBlockTextObj('a')<CR>
onoremap <buffer> <silent> ac :<C-U>call hl#markdown#CodeBlockTextObj('a')<CR>

