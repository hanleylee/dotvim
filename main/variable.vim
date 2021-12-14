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
let g:is_win = (has('win32') || has('win64')) ? v:true : v:false
let g:is_linux = (has('unix') && !has('macunix')) ? v:true : v:false
let g:is_mac = has('macunix') ? v:true : v:false

if has('nvim')
    lua vim.g["system_name"] = vim.loop.os_uname().sysname
else
    if has('win32')
        let g:system_name = 'Windows_NT'
    elseif has('macunix')
        let g:system_name = 'Darwin'
    else
        let g:system_name = 'Linux'
    endif
endif

" let $VIM_CONFIG=expand('$HOME/.vim')
let $HKMS=expand('$HOME/repo/hkms')
