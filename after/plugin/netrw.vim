" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

"*****************   netrw   ****************************
let g:netrw_hide = 0 "设置默认隐藏
let g:netrw_liststyle = 0 " tree 模式显示风格
let g:netrw_banner = 0 " 显示帮助信息
let g:netrw_browse_split = 0 "控制 <CR> 直接在当前窗口打开光标下文件
let g:netrw_winsize = 30 " 占用宽度
let g:netrw_list_hide= '\(^\|\s\s\)\zs\.\S\+' " 需要隐藏的文件
let g:netrw_altv = 1 " 控制 v 分裂的窗口位于右边
let g:netrw_preview = 1 " 默认是水平分割, 此项设置使之垂直分割
let g:netrw_alto = 0 " 控制预览窗口位于左侧或右侧, 与 netrw_preview 共同作用
let g:netrw_keepdir=0
let g:netrw_special_syntax=1
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_nogx = 1 " disable gx keymap
" let g:netrw_browsex_viewer='open'
" let g:netrw_fastbrowse = 0
" let g:netrw_chgwin = 2 " 控制按下 <CR> 的新文件在位于屏幕右侧的 2 号窗口打开, Lex 默认会设为 2
