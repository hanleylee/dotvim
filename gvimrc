" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

set encoding=utf-8                            " MacVim: use UTF-8 everywhere.
set antialias                                 " MacVim: smooth fonts.
set guifont=YaHei\ Fira\ Icon\ Hybrid:h16     " 设置 GUI 下字体及大小, 针对 MacVim 进行设置
set guifontwide=YaHei\ Fira\ Icon\ Hybrid:h14 " 设置 GUI 下中文字体及大小, 针对 MacVim 进行设置
set guicursor+=a:blinkon0                     " 设置光标不闪动
set guioptions-=e                             " 有多个 tab(文件) 时使用系统原生的 tab 样式
set guioptions-=T                             " MacVim: hide toolbar.
set guioptions-=r                             " MacVim: hide right scrollbar.
set guioptions-=R                             " MacVim: hide right scrollbar.
set guioptions-=l                             " MacVim: hide left scrollbar.
set guioptions-=L                             " MacVim: hide left scrollbar.
set tabpagemax=100
set toolbariconsize=small
set lines=100
set columns=160
set macmeta                                   " Receive meta key
set blurradius=10
set nofullscreen
set fuoptions=maxvert,maxhorz
set macligatures
set macthinstrokes
set transparency=0
" set noimd
" if has('gui_macvim')
"     let macvim_skip_cmd_opt_movement = 1
" endif
" if has('gui_macvim')
"   " This removes the Cmd-P binding from 'Print':
"   macmenu &File.Print key=<nop>
" endif
