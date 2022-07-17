" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !exists('b:loaded_ft_markdown')
    command! -range=% -nargs=0 FormatMarkdown let b:view = winsaveview() | silent! <line1>,<line2> call hl#markdown#Format() | call winrestview(b:view)
endif

setlocal synmaxcol=0  " Text after this column number is not highlighted
setlocal textwidth=0
" setlocal wrapmargin=20 " used for hard wrap
setlocal breakat=''
setlocal breakindent
" setlocal foldmethod=expr
" setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,b:-
setlocal conceallevel=2
" 设置 gq 时判断的列表, 如果是列表的话会使用列表后的第一个字符的作为缩进距离
setlocal formatlistpat=^\\s*\\d\\+\\.\\s\\+\\\|^\\s*[-*+]\\s\\+\\\|^\\[^\\ze[^\\]]\\+\\]:
" 允许对multi_byte字符换行（否则默认只能空格或者英文标点，详见set breakat=）
" setlocal formatoptions+=mM
setlocal formatoptions+=o2mbB1
" formatoptions=tcqlno2B1r
" o   Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
" 2   When formatting text, use the indent of the second line of a paragraph for the rest of the paragraph, instead of the indent of the first line.
"    This supports paragraphs in which the first line has a different indent than the rest.  Note that 'autoindent' must be set too
" m   Also break at a multibyte character above 255.  This is useful for Asian text where every character is a word on its own.
" B   When joining lines, don't insert a space between two multibyte characters.  Overruled by the 'M' flag.
" 1   Don't break a line after a one-letter word.  It's broken before it instead (if possible).

" nnoremap <silent><buffer> <Tab>  za
" nmap <silent><buffer> <S-Tab> zA

" undo break points
inoremap <buffer> , ,<C-g>u
inoremap <buffer> . .<C-g>u
inoremap <buffer> ! !<C-g>u
inoremap <buffer> ? ?<C-g>u

" jumplist mutations
nnoremap <buffer> <expr> k (v:count > 5 ? "m'" . v:count : "") . 'gk'
nnoremap <buffer> <expr> j (v:count > 5 ? "m'" . v:count : "") . 'gj'

noremap <silent><buffer> gj  j
noremap <silent><buffer> gk  k

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
