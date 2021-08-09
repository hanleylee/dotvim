" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('vim-floaterm')
    finish
endif

command! LF FloatermNew lf
command! FFF FloatermNew fff
command! NNN FloatermNew nnn
command! XPLR FloatermNew xplr
command! Ranger FloatermNew ranger
command! Vifm FloatermNew vifm

