" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License


if g:is_in_term && g:is_in_vim
    " <M-a> ~ <M-z>
    execute "set <M-a>=\ea"
    execute "set <M-b>=\eb"
    execute "set <M-c>=\ec"
    execute "set <M-d>=\ed"
    execute "set <M-e>=\ee"
    execute "set <M-f>=\ef"
    execute "set <M-g>=\eg"
    execute "set <M-h>=\eh"
    execute "set <M-i>=\ei"
    execute "set <M-j>=\ej"
    execute "set <M-k>=\ek"
    execute "set <M-l>=\el"
    execute "set <M-m>=\em"
    execute "set <M-n>=\en"
    execute "set <M-o>=\eo"
    execute "set <M-p>=\ep"
    execute "set <M-q>=\eq"
    execute "set <M-r>=\er"
    execute "set <M-s>=\es"
    execute "set <M-t>=\et"
    execute "set <M-u>=\eu"
    execute "set <M-v>=\ev"
    execute "set <M-w>=\ew"
    execute "set <M-x>=\ex"
    execute "set <M-y>=\ey"

    execute "set <M-A>=\eA"
    execute "set <M-B>=\eB"
    execute "set <M-C>=\eC"
    execute "set <M-D>=\eD"
    execute "set <M-E>=\eE"
    execute "set <M-F>=\eF"
    execute "set <M-G>=\eG"
    execute "set <M-H>=\eH"
    execute "set <M-I>=\eI"
    execute "set <M-J>=\eJ"
    execute "set <M-K>=\eK"
    execute "set <M-L>=\eL"
    execute "set <M-M>=\eM"
    execute "set <M-N>=\eN"
    execute "set <M-O>=\eO"
    execute "set <M-P>=\eP"
    execute "set <M-Q>=\eQ"
    execute "set <M-R>=\eR"
    execute "set <M-S>=\eS"
    execute "set <M-T>=\eT"
    execute "set <M-U>=\eU"
    execute "set <M-V>=\eV"
    execute "set <M-W>=\eW"
    execute "set <M-X>=\eX"
    execute "set <M-Y>=\eY"

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

if g:is_in_term " 在终端中
    " wrong!!!
    " execute "set <D-z>=\ez"
    " 改变思路, 从 `term keycode -> vim keycode` 到 `term keycode -> vim keystroke`
    " execute "nmap \ed-r <D-r>"
    nmap <lt>D-r> <D-r>
    nmap <lt>D-b> <D-b>
    nmap <lt>D-/> <D-/>

endif

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
