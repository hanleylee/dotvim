" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

command! -range=% -nargs=0 -buffer FormatMarkdown let b:view = winsaveview() | silent! <line1>,<line2> call hl#markdown#format() | call winrestview(b:view)

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

" undo break points
inoremap <buffer> , ,<C-g>u
inoremap <buffer> . .<C-g>u
inoremap <buffer> : :<C-g>u
inoremap <buffer> ; ;<C-g>u
inoremap <buffer> ! !<C-g>u
inoremap <buffer> ? ?<C-g>u

" jumplist mutations
nnoremap <buffer> <expr> k (v:count > 5 ? "m'" . v:count : "") . 'gk'
nnoremap <buffer> <expr> j (v:count > 5 ? "m'" . v:count : "") . 'gj'

noremap <silent><buffer> gj  j
noremap <silent><buffer> gk  k

" mark italic
vnoremap <silent><buffer> <Leader>m/ :<C-u>call hl#markdown#mark_italic(visualmode())<CR>
nnoremap <silent><buffer> <Leader>m/ :set operatorfunc=hl#markdown#mark_italic<CR>g@

" Extract italic
nmap <silent><buffer> <Leader>d/ ds*

" mark bold
vnoremap <silent><buffer> <Leader>mb :<C-u>call hl#markdown#mark_bold(visualmode())<CR>
nnoremap <silent><buffer> <Leader>mb :set operatorfunc=hl#markdown#mark_bold<CR>g@

" Extract bold
" nmap <silent><buffer> <Leader>db :<C-u>call hl#markdown#extract_bold()<CR>
noremap <silent> <Plug>(MarkdownExtractBold) :<C-u>call hl#markdown#extract_bold()<Bar>silent! call repeat#set("\<lt>Plug>(MarkdownExtractBold)")<CR>
nmap <silent><buffer> <Leader>db <Plug>(MarkdownExtractBold)

" mark code
vnoremap <silent><buffer> <Leader>mc :<C-u>call hl#markdown#mark_code(visualmode())<CR>
nnoremap <silent><buffer> <Leader>mc :set operatorfunc=hl#markdown#mark_code<CR>g@

" Extract code
nmap <silent><buffer> <Leader>dc ds`

" mark deleted
vnoremap <silent><buffer> <Leader>md :<C-u>call hl#markdown#mark_deleted(visualmode())<CR>
nnoremap <silent><buffer> <Leader>md :set operatorfunc=hl#markdown#mark_deleted<CR>g@

" Extract deleted
nmap <silent><buffer> <Leader>dd ds~.

" increase level
vnoremap <silent><buffer> <Leader>al <Cmd> call hl#keep_mode_cursor_execute('HeaderIncrease')<CR>
nnoremap <silent><buffer> <Leader>al :call hl#keep_mode_cursor_execute('HeaderIncrease')<CR>
" decrease level
vnoremap <silent><buffer> <Leader>xl <Cmd> call hl#keep_mode_cursor_execute('HeaderDecrease')<CR>
nnoremap <silent><buffer> <Leader>xl :call hl#keep_mode_cursor_execute('HeaderDecrease')<CR>

" convert hash key '#' line to markdown list '-'
noremap <silent> <Plug>(MarkdownConvertHashKeyToList)   :call hl#markdown#convert_hash_key_to_list()<Bar>silent! call repeat#set("\<lt>Plug>(MarkdownConvertHashKeyToList)")<CR>
map <silent><buffer> <Leader>htl <Plug>(MarkdownConvertHashKeyToList)

" text object for code block
vnoremap <buffer> <silent> ic :<C-U>call hl#markdown#CodeBlockTextObj('i')<CR>
onoremap <buffer> <silent> ic :<C-U>call hl#markdown#CodeBlockTextObj('i')<CR>
vnoremap <buffer> <silent> ac :<C-U>call hl#markdown#CodeBlockTextObj('a')<CR>
onoremap <buffer> <silent> ac :<C-U>call hl#markdown#CodeBlockTextObj('a')<CR>
