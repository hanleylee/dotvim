" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

let g:hl_rootmarkers = [
            \ '.svn', 
            \ '.git', 
            \ '.root', 
            \ '.project', 
            \ '.hg', 
            \ '_darcs', 
            \ 'build.xml',
            \ 'Makefile',
            \ 'CMakeLists.txt',
            \ ]
let g:is_in_macvim_gui = has('gui_macvim') && has('gui_running') " 位于 macvim 的gui 模式下
let g:is_in_gui = empty($TERM) || g:is_in_macvim_gui
let g:is_in_term = !g:is_in_gui " 位于终端中
let g:is_in_iterm = $TERM_PROGRAM ==? 'iTerm.app'
let g:is_in_apple_term = $TERM_PROGRAM ==? 'Apple_Terminal'
let g:is_in_nvim = has('nvim') " 位于 neovim 中
let g:is_in_vim = !g:is_in_nvim " 位于 vim 中
