" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

"███████████████████████   Vim 系统特性   ██████████████████████████

"=======================   Main   =================================={{{
set nocompatible " 关闭 vi 兼容模式, 必选

if has('nvim')
    " 设置 viminfo, 必须放在 nocompatible 之后
    set viminfo='1000,f1,<500,:1000,@1000,/1000,h,r/Users/hanley/Desktop/t1,s10,n~/.vim/.nviminfo
else
    " 设置 viminfo, 必须放在 nocompatible 之后
    " 同时 viminfo 的默认位置是 ~/.viminfo, 这里为它赋予不同路径用来防止在 vim -u NONE 时原有的数据被覆盖
    set viminfo='1000,f1,<500,:1000,@1000,/1000,h,r/private/tmp,s10,n~/.vim/.viminfo
endif

filetype plugin indent on " 开启插件功能,必选
" set shell=bash\ -i
set shell=zsh
set modifiable " 设置文件可被修改
set tags=./.tags;,./tags;,.tags,tags
set dictionary+=~/.vim/dict/all.dict " 加载全局 dict, filetype 的 dict 由 vim-dict 插件负责
set splitbelow " 设置新的垂直分割窗口在下侧
set splitright " 设置新的垂直分割窗口在右侧
set modeline
set modelines=5
set history=10000 " 历史命令最大记录数
set confirm " Ask for confirmation when handling unsaved or read-only files
set autowrite " Auto-write the file based on some condition
set autoread
set backup " backup 当前文件
set writebackup " 在保存时自动写入 backup
set undofile
set backupcopy=yes " 默认为 auto, yes 性能低, no 直接重写, auto 会自动选择, 在 mac 上 auto 会覆盖文件创建时间
set cedit=<C-Y>

" Ignore certain files and folders when globing
set wildignore+=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe
set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
set wildignore+=*.py[co],*.pkl
set wildignore+=*.DS_Store,.*.swp
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set wildignorecase  " ignore file and dir name cases in cmd-completion

let s:undo_dir = has('nvim') ? expand('$HOME/.cache/nvim/undo') : expand('$HOME/.cache/vim/undo')
let s:backup_dir = has('nvim') ? expand('$HOME/.cache/nvim/backup') : expand('$HOME/.cache/vim/backup')
let s:cache_dir = has('nvim') ? expand('$HOME/.cache/nvim/swp') : expand('$HOME/.cache/vim/swp')

call GuardExistDirectory(s:undo_dir)
let &undodir=s:undo_dir
call GuardExistDirectory(s:backup_dir)
let &backupdir=s:backup_dir
call GuardExistDirectory(s:cache_dir)
let &directory=s:cache_dir
" Skip backup for patterns in option wildignore
let &backupskip=&wildignore
" execute 'set directory=' . s:cache_dir

" set signcolumn=number
" set pythonthreedll=/opt/homebrew/Frameworks/Python.framework/Versions/Current/Python
" set pythonthreehome=/opt/homebrew/Frameworks/Python.framework/Versions/Current
set mouse+=a " mouse enable for all modes
set mousemodel=popup  " Set the behaviour of mouse
set visualbell " 错误时不发出声音, 只显示在屏幕上
set noerrorbells  " Do not use errorbells
set spelllang=en,cjk  " Spell languages
set spellsuggest+=9  " show 9 spell suggestions at most
set virtualedit=block  " Virtual edit is useful for visual block edit
set ttimeout        " time out for key codes
set ttimeoutlen=10  " wait up to 20ms after Esc for special key(default 1s)
set switchbuf+=usetab,newtab
set hidden  " 允许在未保存 buffer 的时候切换至另一个 buffer
set tabpagemax=50
"}}}

"=======================   File   ======================={{{
set fileformat=unix " 保存文件的格式为 unix
set fileformats=unix,mac,dos
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set encoding=utf-8 " UTF-8 支持
scriptencoding utf-8
set termencoding=utf-8
set fileencoding=utf-8 " 编码方式为 utf-8
set updatetime=50 " 如果在此时间内没有操作, 则会在磁盘上写入 swap 文件, 默认为 4000(时间越短越卡); 也会影响到 coc 的 highlight
" set autochdir " 自动将当前编辑文件的路径变为工作目录(比如用于 args 批量操作)
" set autowriteall " 类似 autowrite, 但是在文件关闭, 切换等场景上会自动触发保存, 本项设置后相当于开启了 autowrite
let filetype_m='objc'
" let filetype_mm='objc'
"}}}

"=======================   Search   ============================={{{
set hlsearch " highlight all matching phrases after <enter>, equal to 'hls'
set incsearch " show partial matches for a search phrase when typing, equal to 'is'
set ignorecase " ignore upper/lower case when searching, equal to 'ic'
set smartcase " 搜索时只有输入大写字母时才会强制符合大小写, 需要与 ignorecase 一同设置才能正常工作
set showmatch " 匹配括号

" External program to use for grep command
set grepprg=grep\ -nH\ $*
if executable('rg')
  set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
  set grepformat=%f:%l:%c:%m
endif

"}}}

"=======================   Indent   ========================={{{
" set backspace& " 重置 backspace 选项
set backspace=indent,eol,start " Backspace 键可以删除的字符
set autoindent " 自动缩进, 需要与 smartindent 配合使用才有效果
set smartindent " 智能缩进, 在进行代码编写的时候会智能判断缩进距离, 与 autoindent 配合使用
set smarttab
set shiftwidth=4 " 设置缩进的字符数, 与 tabstop 不同, 这个是系统进行自动缩进时会使用的值
set tabstop=4 " 按下一次 tab 键缩进的距离, 不代表空格或制表符
set expandtab " 缩进使用空格代表, 如果要使用制表符可以改为 noexpandtab, 设置后旧文件仍然采用之前的 tab 格式, 可以使用`%retab!`强制转换为新tab 格式
"}}}

"=======================   Fold   ========================={{{
set foldenable " 保证在开启文件的时候是全部展开的
set foldmethod=manual
" set sessionoptions-=folds
set foldopen-=hor
set foldnestmax=10
set foldlevel=3
" }}}


"=======================   Format   ============================{{{
set formatoptions-=croql
set formatlistpat=^\\s*                     " Optional leading whitespace
set formatlistpat+=[                        " Start character class
set formatlistpat+=\\[({]\\?                " |  Optionally match opening punctuation
set formatlistpat+=\\(                      " |  Start group
set formatlistpat+=[0-9]\\+                 " |  |  Numbers
set formatlistpat+=\\\|                     " |  |  or
set formatlistpat+=[a-zA-Z]\\+              " |  |  Letters
set formatlistpat+=\\)                      " |  End group
set formatlistpat+=[\\]:.)}                 " |  Closing punctuation
set formatlistpat+=]                        " End character class
set formatlistpat+=\\s\\+                   " One or more spaces
set formatlistpat+=\\\|                     " or
set formatlistpat+=^\\s*[-–+o*•]\\s\\+      " Bullet points
" This handles a broader range of lists
" 1.  Typical item the default handles
" a.  An item with an alphabetic character and punctuation
" (2) An item with punctuation preceding and following it
" •   An item consisting of leading punctuation

" diff options
set diffopt=
set diffopt+=vertical  " show diff in vertical position
set diffopt+=filler  " show filler for deleted lines
if has('patch-8.1.2289')
    set diffopt+=closeoff  " turn off diff when one file window is closed
endif
set diffopt+=context:3  " context for diff
set diffopt+=internal,indent-heuristic,algorithm:histogram
"}}}

"=======================   Appearance   ============================{{{
syntax on " 设置语法高亮
set number " 显示行号
set relativenumber
try
    set matchpairs+=<:>,(:),{:},[:],【:】,《:》,〈:〉,［:］,（:）,「:」,『:』,‘:’,“:” " Set matching pairs of characters and highlight matching brackets
catch /^Vim\%((\a\+)\)\=:E474/
endtry
set wildmenu " 输入部分命令按下 tab 键可以弹出符合的命令列表
set wildmode=full
set showcmd " 右下角显示正在操作的命令
" set cmdheight=2
set list " 设置显示行尾, 换行, 制表符等隐藏字符
set listchars=tab:▸-,eol:↲,trail:-,extends:❯,precedes:❮,nbsp:␣,space:⋅ " 自定义换行, 制表符等显示格式
set linebreak " Break line at predefined characters
" set nowrap  " do no wrap
set showbreak=↪ " Character to show before the lines that have been soft-wrapped
set laststatus=2 " 必须设置, 否则 lightline 不能正确显示
set noshowmode " 隐藏vim 的默认提示当前状态信息, eg. 在状态栏下显示'insert', 'replace'等信息
set t_Co=256 " Vim 能显示的颜色数
set shortmess-=S " 显示当前搜索的结果数量及当前位置
set completeopt=longest,menuone " popup:展示补全列表的侧边窗口
if has('textprop')
    set completeopt+=popup
endif
if has('textprop') && has('quickfix')
    set completepopup=align:menu,border:off,highlight:WildMenu " 调整侧边窗口的样式
endif
set cursorline " 突出光标所在行, 开启后速度变慢
" set cursorcolumn " 突出光标所在列, 开启后速度变慢
set scrolloff=5 " 设置光标距离最顶(底)部的距离不小于 5 行(一旦小于 5 行即触发位于下方的 scrolljump)
" set scrolljump=5 " 光标移动到底部时自动向下翻动 5 行
set signcolumn=yes
set textwidth=150
set viewoptions=folds,options,cursor,curdir,slash,unix
set colorcolumn=+1

if has('arabic')
  set noarabicshape
endif

if has('nvim')
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

if has('termguicolors')
    set termguicolors
endif

set synmaxcol=200  " Text after this column number is not highlighted
set nostartofline
" set linespace=16 " 设置行间距
" set showtabline=2 " 始终显示窗口上头的 tabline
"}}}

" try
"   set completeopt+=popup
"   set completepopup=border:off
" catch /.*/
" endtry
