" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('FastFold')
    finish
endif

let g:fastfold_force = 0    " 默认只对 syntax 启用本功能, 是否对所有都启用本功能
let g:fastfold_minlines = 0 " 最少行数启用fastfold 功能
let g:fastfold_savehook = 0 " 是否在 save 时自动更新折叠
let g:fastfold_fold_command_suffixes = ['x','X','a','A','o','O','c','C','r','R','m','M','i','n','N']
let g:fastfold_fold_movement_commands = [']z', '[z', 'zj', 'zk']
let g:fastfold_skip_filetypes = ['markdown']
