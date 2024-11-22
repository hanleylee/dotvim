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
    let l:word = tolower(a:word)
    for char in split(l:word, '\zs')
        if char2nr(char) > 127
            let is_alpha = v:false
        endif
    endfor
    if is_alpha
        let mdx_dictionary = "/Users/hanley/Library/Eudb_en/牛津高阶英汉双解词典.mdx"
    else
        let mdx_dictionary = "/Users/hanley/Library/Eudb_en/现汉7.mdx"
    endif
    let command = 'mdict -q ' . l:word . ' ' . mdx_dictionary . ' | pandoc -f html -t plain --wrap=auto --columns=150'
    " let command = tool . ' ' . a:word
    let opts = {"close":"button", "title": 'mdict -> ' . mdx_dictionary . ' : ' . l:word}
    call quickui#textbox#command(command, opts)
endfunction

func! hl#quickui#show_translate(word)
    let word = substitute(a:word, '\n', ' ', 'g')
    let tool = 'translator'
    let command = tool . ' ' . '"' . word . '"'
    let opts = {"close": "button", "title": tool}
    call quickui#textbox#command(command, opts)
endfunction

func! hl#quickui#show_context(content)
    let content = [
                \ ["Get D&ocumentation\t\\K", 'call hl#ui#show_documentation()'],
                \ ["&Peek Definition\t\\qp", 'call quickui#tools#preview_tag("")'],
                \ ["--", ],
                \ ["Goto &Definition(Coc)\tgd", "call CocActionAsync('jumpDefinition')"],
                \ ["Goto &References(Coc)\tgr", "call CocActionAsync('jumpReferences')"],
                \ ["Goto I&mplementation(Coc)\tgm", "call CocActionAsync('jumpImplementation')"],
                \ ["Goto T&ype Definition(Coc)\tgy", "call CocActionAsync('jumpTypeDefinition')"],
                \ ["--", ],
                \ ["Find this Definition(g)\t\\cg", 'call feedkeys("\\cg")', 'GNU Global search g'],
                \ ["Find this C Symbol(&s)\t\\cs", 'call feedkeys("\\cs")', 'GNU Gloal search s'],
                \ ["Find functions Called by this function(d)\t\\cd", 'call feedkeys("\\cd")', 'GNU Global search d'],
                \ ["Find functions Calling this function(&c)\t\\cc", 'call feedkeys("\\cc")', 'GNU Global search c'],
                \ ["Find from Ctags(&z)\t\\cz", 'call feedkeys("\\cz")', 'GNU Global search z'],
                \ ["Find this Text String(&t)\t\\ct", 'call feedkeys("\\ct")', 'GNU Global search t'],
                \ ["--", ],
                \ ["ECDICT Dict\t<D-d>", 'call hl#quickui#show_dict("' . a:content . '")'],
                \ ["ECDICT Translate\t<D-t>", 'call hl#quickui#show_translate("' . a:content . '")'],
                \ ["--", ],
                \ ['Cppman', 'exec "Cppman " . expand("<cword>")', '', "c,cpp"],
                \ ['Python Doc', 'call quickui#tools#python_help("")', '', 'python'],
                \ ]
    " set cursor to the last position
    let opts = {'index': g:quickui#context#cursor}

    call quickui#context#open(content, opts)
endfunction
