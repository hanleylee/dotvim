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
func! QuickMenu()
    call quickui#menu#reset()
    " install a 'File' menu, use [text, command] to represent an item.
    call quickui#menu#install('&File', [
                \ [ "&New File\tCtrl+n", 'echo 0' ],
                \ [ '&Open File\t(F3)', 'echo 1' ],
                \ [ '&Close', 'echo 2' ],
                \ [ '--', '' ],
                \ [ '&Save\tCtrl+s', 'echo 3'],
                \ [ 'Save &As', 'echo 4' ],
                \ [ 'Save All', 'echo 5' ],
                \ [ '--', '' ],
                \ [ 'E&xit\tAlt+x', 'echo 6' ],
                \ ])

    " items containing tips, tips will display in the cmdline
    call quickui#menu#install('&Edit', [
                \ [ '&Copy', 'echo 1', 'help 1' ],
                \ [ '&Paste', 'echo 2', 'help 2' ],
                \ [ '&Find', 'echo 3', 'help 3' ],
                \ ])

    " script inside %{...} will be evaluated and expanded in the string
    call quickui#menu#install('&Option', [
                \ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
                \ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
                \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
                \ ])

    call quickui#menu#install('&C/C++', [
                \ [ '&Compile', 'echo 1' ],
                \ [ '&Run', 'echo 2' ],
                \ ], '<auto>', 'c,cpp')

    " register HELP menu with weight 10000
    call quickui#menu#install('H&elp', [
                \ ['&Cheatsheet', 'help index', ''],
                \ ['T&ips', 'help tips', ''],
                \ ['--',''],
                \ ['&Tutorial', 'help tutor', ''],
                \ ['&Quick Reference', 'help quickref', ''],
                \ ['&Summary', 'help summary', ''],
                \ ], 10000)
    call quickui#menu#open()
endfunction
