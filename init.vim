" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License
" Vim 配置原则:
" 1. 一定要了解此项能实现什么功能再配置
" 2. 没有必要的插件能不装就不装, 尽量用 Vim 原生功能

exec 'source ' . expand('$HOME/.vim/main/preinit.vim')

"███████████████████████   Source Load File   ██████████████████████████{{{

"=======================   Options   ============================
call Source('$HOME/.vim/main/options.vim')

"=======================   Variable   ============================
call Source('$HOME/.vim/main/variable.vim')

"=======================   Plugin   ============================
call Source('$HOME/.vim/main/plugin.vim')

"=======================   Function   ============================
call Source('$HOME/.vim/main/function.vim')

"=======================   Path   ============================
call Source('$HOME/.vim/main/path.vim')

"=======================   Terminal Keycode   ============================
if g:is_in_term
    call Source('$HOME/.vim/main/term_keycode.vim')
endif

"=======================   GUI Keycode   ============================
call Source('$HOME/.vim/main/gui_keymap.vim')"

"=======================   Keymap   ============================
call Source('$HOME/.vim/main/keymap.vim')

"=======================   Command   ============================
call Source('$HOME/.vim/main/command.vim')

"=======================   Auto   ============================
call Source('$HOME/.vim/main/autocmd.vim')

"=======================   Appearance   ============================
call Source('$HOME/.vim/main/appearance.vim')
"}}}
