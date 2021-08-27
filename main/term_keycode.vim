" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if g:is_in_gui || g:is_in_nvim
    finish
endif

" " <M-a> ~ <M-z>
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

 " wrong!!!
" execute "set <D-z>=\ez"
" 改变思路, 从 `term keycode -> vim keycode` 到 `term keycode -> vim keystroke`
" execute "nmap \ed-r <D-r>"
nmap <lt>D-r> <D-r>
nmap <lt>D-b> <D-b>
nmap <lt>D-e> <D-e>
nmap <lt>D-/> <D-/>
