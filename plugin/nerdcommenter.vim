" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('nerdcommenter')
    finish
endif

" let g:NERDDefaultAlign = 'left' " Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDAltDelims_c = 1 " 必须设置, 否则下面的自定义不会起作用
" let g:NERDAltDelims_swift = 1 " 必须设置, 否则下面的自定义不会起作用
" let g:NERDCustomDelimiters = {
"             \'c': { 'left': '//', 'right': ''},
"             \'swift': { 'left': '//' },
"             \}
" let g:NERDCommentEmptyLines = 1 " Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDTrimTrailingWhitespace = 1 " Enable trimming of trailing whitespace when uncommenting
" let g:NERDToggleCheckAllLines = 1 " Enable NERDCommenterToggle to check all selected lines is commented or not
