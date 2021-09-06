" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

set encoding=utf-8                            " MacVim: use UTF-8 everywhere.
set guifont=YaHei\ Fira\ Icon\ Hybrid:h18     " 设置 GUI 下字体及大小
set guifontwide=YaHei\ Fira\ Icon\ Hybrid:h16 " 设置 GUI 下中文字体及大小
set guicursor+=a:blinkon0                     " 设置光标不闪动
set guioptions-=e                             " 有多个 tab(文件) 时使用系统原生的 tab 样式
set guioptions-=T                             " MacVim: hide toolbar.
set guioptions-=r                             " MacVim: hide right scrollbar.
set guioptions-=R                             " MacVim: hide right scrollbar.
set guioptions-=l                             " MacVim: hide left scrollbar.
set guioptions-=L                             " MacVim: hide left scrollbar.
set tabpagemax=100
set lines=100
set columns=160

if has('gui_macvim')
    set toolbariconsize=small
    set antialias                                 " MacVim: smooth fonts.
    set macmeta                                   " Receive meta key
    set blurradius=10
    set nofullscreen
    set fuoptions=maxvert,maxhorz
    set macligatures
    set macthinstrokes
    set transparency=0
"     let macvim_skip_cmd_opt_movement = 1
"   " This removes the Cmd-P binding from 'Print':
"   macmenu &File.Print key=<nop>
endif
