" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-indent-guides')
    finish
endif

" "*****************   nathanaelkane/vim-indent-guides   ****************
" let g:indent_guides_enable_on_vim_startup = 1 "是否在启动时自动运行
" let g:indent_guides_guide_size = 1 "设置缩进线宽度, 1 个字符
" let g:indent_guides_start_level = 2 "启动等级
" let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify'] "在某些类型中不设置缩进线
" let g:indent_guides_auto_colors = 1 "控制缩进线是否使用默认颜色, 最好使用, 否则缩进线中的圆点会被突出显示. 如果确定不使用的话需要在下方命令中指定颜色
" "autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#373737   ctermbg=3
" "autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#373737 ctermbg=4

