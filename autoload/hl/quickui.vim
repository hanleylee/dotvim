" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" quick menu{{{
func! hl#quickui#quick_menu()
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
"}}}

func! hl#quickui#show_dict(word)
    let is_alpha = v:true
    for char in split(a:word, '\zs')
        if char2nr(char) > 127
            let is_alpha = v:false
        endif
    endfor
    if is_alpha
        let tool = 'ecdict'
    else
        let tool = 'sdcv'
    endif
    let command = tool . ' ' . a:word
    let opts = {"close":"button", "title": tool . ' -> ' . a:word}
    call quickui#textbox#command(command, opts)
endfunction

func! hl#quickui#show_translate(word)
    let word = substitute(a:word, '\n', ' ', 'g')
    let tool = 'translator'
    let command = tool . ' ' . '"' . word . '"'
    let opts = {"close": "button", "title": tool}
    call quickui#textbox#command(command, opts)
endfunction
