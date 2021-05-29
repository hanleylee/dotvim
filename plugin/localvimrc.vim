if !PlugLoaded('vim-localvimrc')
    finish
endif

let g:localvimrc_name=[".lvimrc"]
let g:localvimrc_enable=1
let g:localvimrc_ask=1
let g:localvimrc_persistent=2
let g:localvimrc_count=1 "最多加载多少个 localvimrc 文件
let g:localvimrc_reverse=1 "从当前文件依次向根目录查找并加载配置 localvimrc 文件
