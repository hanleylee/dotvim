" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

"███████████████████████   Vim 系统特性   ██████████████████████████

"=======================   Main   =================================={{{
set nocompatible " 关闭 vi 兼容模式, 必选

if has('nvim')
    " 设置 viminfo, 必须放在 nocompatible 之后
    set viminfo='1000,f1,<100,:100,@100,/100,h,r/Users/hanley/Desktop/t1,r/Volumes,s10,n~/.vim/.nviminfo
else
    " 设置 viminfo, 必须放在 nocompatible 之后
    " 同时 viminfo 的默认位置是 ~/.viminfo, 这里为它赋予不同路径用来防止在 vim -u NONE 时原有的数据被覆盖
    set viminfo='1000,f1,<100,:100,@100,/100,h,r/private/tmp,r/private/var,r/Applications,r/Volumes,s10,n~/.vim/.viminfo
endif

filetype plugin indent on " 开启插件功能,必选
" set shell=bash\ -i
set shell=zsh
set modifiable " 设置文件可被修改
set tags=./.tags;,./tags;,.tags,tags
set dictionary+=~/.vim/dict/all.dict " 加载全局 dict, filetype 的 dict 由 vim-dict 插件负责
set splitbelow " 设置新的垂直分割窗口在下侧
set splitright " 设置新的垂直分割窗口在右侧
if has('patch-9.0.0667')
    set splitkeep=screen " 水平分割视图时, 其中一个视图关闭能保证其余视图相对于屏幕位置不变
endif
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
" set wildignore+=*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**
set wildignore+=*/__pycache__/*,*/build/**
set wildignore+=*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico
set wildignore+=*.py[co],*.pkl
set wildignore+=*.DS_Store,.*.swp
set wildignore+=*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set wildignorecase  " ignore file and dir name cases in cmd-completion

let s:undo_dir = has('nvim') ? expand('$HOME/.cache/nvim/undo') : expand('$HOME/.cache/vim/undo')
let s:backup_dir = has('nvim') ? expand('$HOME/.cache/nvim/backup') : expand('$HOME/.cache/vim/backup')
" let s:swap_dir = has('nvim') ? expand('$HOME/.cache/nvim/swp') : expand('$HOME/.cache/vim/swp')

call GuardExistDirectory(s:undo_dir)
let &undodir=s:undo_dir
call GuardExistDirectory(s:backup_dir)
let &backupdir=s:backup_dir
let &backupskip=&wildignore
set noswapfile " for personal use, I don't want use swap file
" call GuardExistDirectory(s:swap_dir)
" let &directory=s:swap_dir
" Skip backup for patterns in option wildignore
" execute 'set directory=' . s:cache_dir

" By default, MacVim's pythonthreedll points to '/opt/homebrew/Frameworks/Python.framework/Versions/3.10/Python',
" because MacVim is built against that version. In order to have a working Python 3 interface, you can either:
" - install Python 3.10 via homebrew,
" - or point pythonthreedll to a valid path.
" set pythonthreedll=/opt/homebrew/Frameworks/Python.framework/Versions/3.11/lib/libpython3.11.dylib
let &pythonthreedll = trim(system("pyenv which python"))
" 如果仅是下载并解压程序包(而不是进行安装), 那么同时需要设置 pythonthreehome 选项
" set pythonthreehome=/opt/homebrew/Frameworks/Python.framework/Versions/Current
set mouse+=a " mouse enable for all modes
if g:is_in_vim
    set ttymouse=sgr
    set balloonevalterm
endif
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
" When a file is read, Vim tries to use the first mentioned character encoding. If an error is detected, the next one in the list is tried.
" When an encoding is found that works, 'fileencoding' is set to it.  If all fail, 'fileencoding' is set to an empty string, which means the value of 'encoding' is used.
set fileencodings=utf-8,ucs-bom,gb2312,gb18030,iso-8859-2,gbk,cp936
" 'fileencodings' is not used for a new file, the global value of 'fileencoding' is used instead.
" IMPORTANT: When 'fileencoding' is different from 'encoding', conversion will be done when writing the file.
setglobal fileencoding=utf-8 " 编码方式为 utf-8
set encoding=utf-8 " UTF-8 支持
setglobal nofixendofline
scriptencoding utf-8
set termencoding=utf-8
set updatetime=200 " 如果在此时间内没有操作, 则会在磁盘上写入 swap 文件, 默认为 4000(时间越短越卡); 也会影响到 coc 的 highlight
" set autochdir " 自动将当前编辑文件的路径变为工作目录(比如用于 args 批量操作)
" set autowriteall " 类似 autowrite, 但是在文件关闭, 切换等场景上会自动触发保存, 本项设置后相当于开启了 autowrite
let filetype_m='objc'
let filetype_mm='objcpp'
" let filetype_mm='objc'
"}}}

"=======================   Search   ============================={{{
set hlsearch " highlight all matching phrases after <enter>, equal to 'hls'
set incsearch " show partial matches for a search phrase when typing, equal to 'is'
set ignorecase " ignore upper/lower case when searching, equal to 'ic'
set smartcase " 搜索时只有输入大写字母时才会强制符合大小写, 需要与 ignorecase 一同设置才能正常工作
set showmatch " 匹配括号

" External program to use for grep command
if executable('rg')
    set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
    set grepformat=%f:%l:%c:%m
else
    set grepprg=grep\ -nH\ $*
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
" default value in vim8 is: tcq
" default value in neovim is: tcqj
set formatoptions=tcroqlj
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

if has('patch-8.2.0860')
    set nrformats+=unsigned " ignore sign of number when increase or decrease
endif

" diff options
set diffopt=
set diffopt+=vertical  " show diff in vertical position
set diffopt+=filler  " show filler for deleted lines
if has('patch-8.1.2289')
    set diffopt+=closeoff  " turn off diff when one file window is closed
endif
set diffopt+=context:3  " context for diff
try
    set diffopt+=internal,indent-heuristic,algorithm:histogram
catch
    echom 'diffopt not full support'
endtry
"}}}

"=======================   Appearance   ============================{{{
syntax on " 设置语法高亮
set number " 显示行号
" set relativenumber
try
    set matchpairs+=<:>,(:),{:},[:],【:】,《:》,〈:〉,［:］,（:）,「:」,『:』,‘:’,“:” " Set matching pairs of characters and highlight matching brackets
catch /^Vim\%((\a\+)\)\=:E474/
endtry
set wildmenu " 输入部分命令按下 tab 键可以弹出符合的命令列表
set wildoptions=pum
set wildmode=full
set showcmd " 右下角显示正在操作的命令
" set cmdheight=2
set list " 设置显示行尾, 换行, 制表符等隐藏字符
set listchars=tab:▸-,eol:↲,trail:-,extends:❯,precedes:❮,nbsp:␣,space:⋅ " 自定义换行, 制表符等显示格式
set linebreak " Break line at predefined characters
" set nowrap  " do not wrap
set showbreak=↪ " Character to show before the lines that have been soft-wrapped
set laststatus=2 " 必须设置, 否则 lightline 不能正确显示
set noshowmode " 隐藏vim 的默认提示当前状态信息, eg. 在状态栏下显示'insert', 'replace'等信息
set t_Co=256 " Vim 能显示的颜色数
set shortmess-=S " 显示当前搜索的结果数量及当前位置
set completeopt=longest,menuone " popup:展示补全列表的侧边窗口
" set pumheight=20
if has('textprop')
    set completeopt+=popup
endif
if has('textprop') && has('quickfix')
    set completepopup=align:menu,border:off,highlight:WildMenu " 调整侧边窗口的样式
endif
set cursorline " 突出光标所在行, 开启后速度变慢
" set cursorcolumn " 突出光标所在列, 开启后速度变慢
set scrolloff=0 " 设置光标距离最顶(底)部的距离不小于 x 行(一旦小于 x 行即触发位于下方的 scrolljump)
" set smoothscroll " 避免一行太长超出一屏情况下上下移动光标导致内容不可见
" set scrolljump=5 " 光标移动到底部时自动向下翻动 5 行
" set signcolumn=number
set signcolumn=yes
set textwidth=150
" set viewoptions=folds,cursor,curdir,slash,unix
" set viewoptions-=options
set maxmempattern=5000
set viewoptions=folds,cursor,curdir
set colorcolumn=+1
if has('patch-9.0.1921')
    set jumpoptions=stack
endif

if has('arabic')
    set noarabicshape
endif

if has('nvim')
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" MARK: These settings must be placed before setting the colorscheme. It is also important that the value of the vim term variable is not changed after these settings.
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
if g:is_in_vim && has('patch-8.2.2345')
    execute "set <FocusGained>=\<Esc>[I"
    execute "set <FocusLost>=\<Esc>[O"
endif
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''
let &t_ut = '' " Adapt for kitty
if has('termguicolors')
    set termguicolors
endif

set synmaxcol=1000  " Text after this column number is not highlighted
set nostartofline
" set linespace=16 " 设置行间距
set showtabline=1 " 自动显示窗口上头的 tabline, 只有一个tab时不显示tabline
" set showtabline=2 " 始终显示窗口上头的 tabline
"}}}

" try
"   set completeopt+=popup
"   set completepopup=border:off
" catch /.*/
" endtry
