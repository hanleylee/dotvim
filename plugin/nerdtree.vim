" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('nerdtree')
    finish
endif

let g:NERDTreeMapMenu='mn'
let g:NERDTreeChDirMode=1
let g:NERDTreeShowBookmarks=1 "显示书签
let g:NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$'] "设置忽略文件类型
let g:NERDTreeWinSize=40 "窗口大小
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeShowHidden = 1
let g:NERDTreeAutoDeleteBuffer = 1
let g:NERDTreeAutoCenter = 0
let g:NERDTreeQuitOnOpen=1
let g:NERDTreeHijackNetrw=0
