" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License


if g:is_in_origin_vim

    for index in range(26)
        " <M-A> ~ <M-Z>
        call MapMetaCode(nr2char(65 + index))
        " <M-a> ~ <M-z>
        call MapMetaCode(nr2char(97 + index))
    endfor

    let s:punctuation_list = [',', '.', ';', ':', '/', '?', '-', '_', '{', '}', '=', '+', "'"]
    for c in s:punctuation_list
        call MapMetaCode(c)
    endfor
    unlet s:punctuation_list

    for index in range(10)
        call MapMetaCode(nr2char(char2nr('0') + index))
    endfor


    execute "set <S-F1>=\e[1;2P"
    execute "set <S-F2>=\e[1;2Q"
    execute "set <S-F3>=\e[1;2R"
    execute "set <S-F4>=\e[1;2S"
    execute "set <S-F5>=\e[15;2~"
    execute "set <S-F6>=\e[17;2~"
    execute "set <S-F7>=\e[18;2~"
    execute "set <S-F8>=\e[19;2~"
    execute "set <S-F9>=\e[20;2~"
    execute "set <S-F10>=\e[21;2~"
    execute "set <S-F11>=\e[23;2~"
    execute "set <S-F12>=\e[24;2~"

    execute "set <F13>=\eO2P"
    execute "set <F14>=\eO2Q"
    execute "set <F15>=\eO2R"
    execute "set <F16>=\eO2S"
    execute "set <F17>=\e[15;2~"
    execute "set <F18>=\e[17;2~"
    execute "set <F19>=\e[18;2~"
    execute "set <F20>=\e[19;2~"
    execute "set <F21>=\e[20;2~"
    execute "set <F22>=\e[21;2~"
    execute "set <F23>=\e[23;2~"
    execute "set <F24>=\e[24;2~"
    execute "set <F25>=\eO5P"
    execute "set <F26>=\eO5Q"
    execute "set <F27>=\eO5R"
    execute "set <F28>=\eO5S"
    execute "set <F29>=\e[15;5~"
    execute "set <F30>=\e[17;5~"
    execute "set <F31>=\e[18;5~"
    execute "set <F32>=\e[19;5~"
    execute "set <F33>=\e[20;5~"
    execute "set <F34>=\e[21;5~"
    execute "set <F35>=\e[23;5~"
    execute "set <F36>=\e[24;5~"
    execute "set <F37>=\eO6P"
    " imap <lt>D-BS> <D-BS>
    " nmap <lt>D-e> <D-e>
endif

" wrong!!!
" execute "set <D-z>=\ez"
" 改变思路, 从 `term keycode -> vim keycode` 到 `term keycode -> vim keystroke`
" execute "nmap \ed-r <D-r>"
nmap  <lt>D-1>          <D-1>
nmap  <lt>D-2>          <D-2>
nmap  <lt>D-3>          <D-3>
nmap  <lt>D-4>          <D-4>
nmap  <lt>D-5>          <D-5>
nmap  <lt>D-6>          <D-6>
nmap  <lt>D-7>          <D-7>
nmap  <lt>D-8>          <D-8>
nmap  <lt>D-9>          <D-9>
nmap  <lt>D-0>          <D-0>
nmap  <lt>D-/>          <D-/>
map   <lt>D-r>          <D-r>
map   <lt>D-b>          <D-b>
vmap  <lt>D-c>          <D-c>
vmap  <lt>D-x>          <D-x>
tmap  <lt>D-v>          <D-v>
nmap  <lt>D-v>          <D-v>
vmap  <lt>D-v>          <D-v>
imap  <lt>D-v>          <D-v>
cmap  <lt>D-v>          <D-v>
map   <lt>D-Left>       <D-Left>
map!  <lt>D-Left>       <D-Left>
map   <lt>D-Right>      <D-Right>
map!  <lt>D-Right>      <D-Right>
map   <lt>D-Up>         <D-Up>
imap  <lt>D-Up>         <D-Up>
map   <lt>D-Down>       <D-Down>
imap  <lt>D-Down>       <D-Down>
imap  <lt>D-BS>         <D-BS>
nmap  <lt>D-w>          <D-w>
imap  <lt>D-w>          <D-w>
nmap  <lt>D-s>          <D-s>
map   <lt>D-s>          <D-s>
vmap  <lt>D-s>          <D-s>
imap  <lt>D-s>          <D-s>
imap  <lt>D-z>          <D-z>
map   <lt>S-D-z>        <S-D-z>
map   <lt>D-z>          <D-z>
imap  <lt>S-D-z>        <S-D-z>
map   <lt>D-a>          <D-a>
imap  <lt>D-a>          <D-a>
cmap  <lt>D-a>          <D-a>
omap  <lt>D-a>          <D-a>
smap  <lt>D-a>          <D-a>
xmap  <lt>D-a>          <D-a>
map   <lt>D-d>          <D-d>
map   <lt>D-t>          <D-t>

" " 1 ~ =
" map ¡  <M-1>
" map ™  <M-2>
" map £  <M-3>
" map ¢  <M-4>
" map ∞  <M-5>
" map §  <M-6>
" map ¶  <M-7>
" map •  <M-8>
" map ª  <M-9>
" map º  <M-0>
" map –  <M-->
" map ≠  <M-=>
" " nmap «  <M-\>

" " ! ~ +
" map ⁄  <M-!>
" map €  <M-@>
" map ‹  <M-#>
" map ›  <M-$>
" map ﬁ  <M-%>
" map ﬂ  <M-^>
" map ‡  <M-&>
" map °  <M-*>
" map ·  <M-(>
" map ‚  <M-)>
" map —  <M-_>
" map ±  <M-+>
" map »  <M-|>

" " q ~ ]
" map œ  <M-q>
" map ∑  <M-w>
" map ´  <M-e>
" map ®  <M-r>
" map †  <M-t>
" map ¥  <M-y>
" map ¨  <M-u>
" map ˆ  <M-i>
" map ø  <M-o>
" map π  <M-p>
" map “  <M-[>
" map ‘  <M-]>

" " Q ~ }
" map Œ  <M-Q>
" map „  <M-W>
" map ‰  <M-R>
" map ˇ  <M-T>
" map Á  <M-Y>
" map Ø  <M-O>
" map ∏  <M-P>
" map ”  <M-{>
" map ’  <M-}>

" " a ~ '
" map å  <M-a>
" map ß  <M-s>
" map ∂  <M-d>
" map ƒ  <M-f>
" map ©  <M-g>
" map ˙  <M-h>
" map ∆  <M-j>
" map ˚  <M-k>
" map ¬  <M-l>
" map …  <M-;>
" map æ  <M-'>

" " A ~ "
" map Å  <M-A>
" map Í  <M-S>
" map Î  <M-D>
" map Ï  <M-F>
" map ˝  <M-G>
" map Ó  <M-H>
" map Ô  <M-J>
" map   <M-K>
" map Ò  <M-L>
" " map Ú  <M-:>
" map Æ  <M-">

" " z ~ /
" map Ω  <M-z>
" map ≈  <M-x>
" map ç  <M-c>
" map √  <M-v>
" map ∫  <M-b>
" map ˜  <M-n>
" map µ  <M-m>
" map ≤  <M-,>
" map ≥  <M-.>
" map ÷  <M-/>

" " Z ~ ?
" map ¸  <M-Z>
" map ˛  <M-X>
" map Ç  <M-C>
" map ◊  <M-V>
" map ı  <M-B>
" map Â  <M-M>
" map ¯  <M-<>
" map ˘  <M->>
" map ¿  <M-?>
