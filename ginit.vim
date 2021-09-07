" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License
"
if exists('g:loaded_gui_init')
    finish
endif

let g:loaded_gui_init = 1

set encoding=utf-8                            " MacVim: use UTF-8 everywhere.
" set guifont=YaHei\ Fira\ Icon\ Hybrid:h16     " 设置 GUI 下字体及大小
" set guifontwide=YaHei\ Fira\ Icon\ Hybrid:h14 " 设置 GUI 下中文字体及大小
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

if has('gui_macvim') " 位于 macvim
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

if exists('g:GuiLoaded') " 当前位于 neovim-qt
    lang en_US.UTF-8
    " Use GuiFont! to ignore font errors
    execute 'GuiFont! ' . 'YaHei Fira Icon Hybrid:h16'

    " Disable GUI Tabline
    GuiTabline 0

    " Disable GUI Popupmenu
    GuiPopupmenu 0

    " Enable GUI ScrollBar
    GuiScrollBar 0
    GuiRenderLigatures 1

    " Right Click Context Menu (Copy-Cut-Paste)
    nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
    inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
    xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
    snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

endif
