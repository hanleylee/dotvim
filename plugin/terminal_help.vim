" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-terminal-help')
    finish
endif

let g:terminal_key = '<m-=>'
let g:terminal_cwd = 1 " initialize working dir: 0 for unchanged, 1 for file path and 2 for project root.
let g:terminal_height = 10 " new terminal height, default to 10.
let g:terminal_pos = 'rightbelow' " where to open the terminal, default to rightbelow.
let g:terminal_shell = 'zsh' " specify shell rather than default one.
let g:terminal_edit = 'tabnew' "command to open the file in vim, default to tab drop.
let g:terminal_kill = 'exit' " set to term to kill term session when exiting vim.
let g:terminal_list = 0 " set to 0 to hide terminal buffer in the buffer list.
let g:terminal_fixheight = 1 " set to 1 to set winfixheight for the terminal window.
let g:terminal_close = 1 " set to 1 to close window if process finished.
