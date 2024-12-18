" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

let b:table_mode_corner='+' "设置转角处为 `|`, 如果设为其他比如`+`, Markdown 语法不支持
let b:table_mode_corner_corner='+'
let b:table_mode_header_fillchar='='

setlocal synmaxcol=0  " Text after this column number is not highlighted
setlocal textwidth=0
" setlocal conceallevel=2
setlocal conceallevel=0
setlocal concealcursor=""
setlocal formatoptions+=o2mbB1

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

func! s:section_delimiter_adjust() abort
    let section_delim = '^\([=`:."' . "'" . '~^_*+#-]\)\1*$'
    let cline = getline('.')
    if cline =~ '^\s*$' | return | endif
    if cline !~ section_delim && cline !~ '^\s\+\S'
        let nline = getline(line('.') + 1)
        let pline = getline(line('.') - 1)
        if pline =~ '^\s*$' && nline =~ section_delim
            call setline(line('.') + 1, repeat(nline[0], strwidth(cline)))
        elseif pline =~ section_delim && nline =~ section_delim && pline[0] == nline[0]
            call setline(line('.') + 1, repeat(nline[0], strwidth(cline)))
            call setline(line('.') - 1, repeat(pline[0], strwidth(cline)))
        endif
    endif
endfunc

augroup rst_section
    au!
    au InsertLeave <buffer> :call s:section_delimiter_adjust()
augroup END

func! s:rst_view() abort
    let output = tempname() . '.html'

    call system(printf("%s %s %s %s",
                \ "rst2html5",
                \ " --input-encoding=utf8 --stylesheet-path=minimal.css,responsive.css",
                \ shellescape(expand("%:p")),
                \ output
                \ ))

    " Comment/Uncomment what is appropriate
    " OSX
    exe ':silent !open ' . output
    " Windows
    " exe ':silent !start ' . output
    " Linux
    " exe ':silent !xdg-open ' . output
endfunc

command! -buffer RSTView call s:rst_view()
