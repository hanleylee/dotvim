" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !exists('b:loaded_ft_markdown')
    command! -range=% -nargs=0 FormatMarkdown let b:view = winsaveview() | silent! <line1>,<line2> call hl#markdown#Format() | call winrestview(b:view)
endif

setlocal conceallevel=2
" 设置 gq 时判断的列表, 如果是列表的话会使用列表后的第一个字符的作为缩进距离
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*[-*+]\\s\\+\\\|^\\[^\\ze[^\\]]\\+\\]:
" setlocal textwidth=0
" setlocal foldmethod=expr
" setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,b:-

noremap <silent><buffer> j   gj
noremap <silent><buffer> k   gk
noremap <silent><buffer> gj  j
noremap <silent><buffer> gk  k

" nmap <silent><buffer> <Tab> za
" nmap <silent><buffer> <S-Tab> zA

" undo break points
inoremap <buffer> , ,<C-g>u
inoremap <buffer> . .<C-g>u
inoremap <buffer> ! !<C-g>u
inoremap <buffer> ? ?<C-g>u

" jumplist mutations
nnoremap <buffer> <expr> k (v:count > 5 ? "m'" . v:count : "") . 'gk'
nnoremap <buffer> <expr> j (v:count > 5 ? "m'" . v:count : "") . 'gj'

" make bold
vmap <silent><buffer> <Leader>/ :<c-u>call hl#markdown#make_italic(visualmode())<cr>
nmap <silent><buffer> <Leader>/ :set operatorfunc=hl#markdown#make_italic<cr>g@
vmap <silent><buffer> <Leader>b :<c-u>call hl#markdown#make_bold(visualmode())<cr>
nmap <silent><buffer> <Leader>b :set operatorfunc=hl#markdown#make_bold<cr>g@

" text object for code block
vnoremap <buffer> <silent> ic :<C-U>call hl#markdown#CodeBlockTextObj('i')<CR>
onoremap <buffer> <silent> ic :<C-U>call hl#markdown#CodeBlockTextObj('i')<CR>
vnoremap <buffer> <silent> ac :<C-U>call hl#markdown#CodeBlockTextObj('a')<CR>
onoremap <buffer> <silent> ac :<C-U>call hl#markdown#CodeBlockTextObj('a')<CR>

let b:loaded_ft_markdown = 1
