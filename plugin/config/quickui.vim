" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('vim-quickui')
    finish
endif

let g:quickui_border_style = 1
let g:quickui_preview_w = 100
let g:quickui_preview_h = 40
" let g:quickui_color_scheme = 'gruvbox'
" enable to display tips in the cmdline
let g:quickui_show_tip = 1

" let content = [
"             \ ["&Help Keyword\t\\ch", 'echo 100' ],
"             \ ["&Signature\t\\cs", 'echo 101'],
"             \ ['-'],
"             \ ["Find in &File\t\\cx", 'echo 200' ],
"             \ ["Find in &Project\t\\cp", 'echo 300' ],
"             \ ["Find in &Defintion\t\\cd", 'echo 400' ],
"             \ ["Search &References\t\\cr", 'echo 500'],
"             \ ['-'],
"             \ ["&Documentation\t\\cm", 'echo 600'],
"             \ ]
" set cursor to the last position
" let opts = {'index':g:quickui#context#cursor}
" call quickui#context#open(content, opts)

" let content = [
"             \ [ 'echo 1', 'echo 100' ],
"             \ [ 'echo 2', 'echo 200' ],
"             \ [ 'echo 3', 'echo 300' ],
"             \ [ 'echo 4' ],
"             \ [ 'echo 5', 'echo 500' ],
"             \]
" let opts = {'title': 'select one'}
" call quickui#listbox#open(content, opts)

" let linelist = [
"             \ "line &1",
"             \ "line &2",
"             \ "line &3",
"             \ ]
" " restore last position in previous listbox
" let opts = {'index':g:quickui#listbox#cursor, 'title': 'select'}
" echo quickui#listbox#inputlist(linelist, opts)

" let content = [
"             \ ["&Help Keyword\t\\ch", 'echo 100' ],
"             \ ["&Signature\t\\cs", 'echo 101'],
"             \ ['-'],
"             \ ["Find in &File\t\\cx", 'echo 200' ],
"             \ ["Find in &Project\t\\cp", 'echo 300' ],
"             \ ["Find in &Defintion\t\\cd", 'echo 400' ],
"             \ ["Search &References\t\\cr", 'echo 500'],
"             \ ['-'],
"             \ ["&Documentation\t\\cm", 'echo 600'],
"             \ ]
" " set cursor to the last position
" let opts = {'index':g:quickui#context#cursor}
" call quickui#context#open(content, opts)

" function! DisplayMessages()
"     let x = ''
"     redir => x
"     silent! messages
"     redir END
"     let x = substitute(x, '[\n\r]\+\%$', '', 'g')
"     let content = filter(split(x, "\n"), 'v:key != ""')
"     let opts = {"close":"button", "title":"Vim Messages"}
"     call quickui#textbox#open(content, opts)
" endfunc

" function! TermExit(code)
"     echom "terminal exit code: ". a:code
" endfunc

" let opts = {'w':60, 'h':8, 'callback':'TermExit'}
" let opts.title = 'Terminal Popup'
" " quick terminal
" call quickui#terminal#open('python', opts)
" " quick switch buffer
" call quickui#tools#list_buffer('e')
" call quickui#tools#list_buffer('tabedit')
" " quick show all function
" call quickui#tools#list_function()
" " Use textbox to display vim help in a popup window
" call quickui#tools#display_help('index')
