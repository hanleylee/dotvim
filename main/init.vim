" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License
" Vim 配置原则:
" 1. 一定要了解此项能实现什么功能再配置
" 2. 没有必要的插件能不装就不装, 尽量用 Vim 原生功能

exec 'source '.expand('$VIMCONFIG/main/preinit.vim')

"███████████████████████   Vim 系统特性   ██████████████████████████

"=======================   Main   ==================================
" set viminfo='50000,~/.viminfo
" set viminfo=%,\"100,'10,/50,:100,h,f0,n~/.viminfo
set nocompatible "关闭 vi 兼容模式, 必选
set viminfo='1000,f1,<500,:1000,@1000,/1000,h,n~/.viminfo "设置 viminfo, 必须放在 nocompatible 之后
filetype plugin indent on "开启插件功能,必选
" set shell=bash\ -i
set shell=zsh
set modifiable "设置文件可被修改
set tags=./.tags;,./tags;,.tags,tags
set splitbelow "设置新的垂直分割窗口在下侧
set splitright "设置新的垂直分割窗口在右侧
set history=10000 "历史命令最大记录数
set backup "backup 当前文件
set writebackup "自动删除旧 backup 文件
set undofile

call GuardExistDirectory(expand('$HOME/.cache/vim/undo'))
set undodir=$HOME/.cache/vim/undo
call GuardExistDirectory(expand('$HOME/.cache/vim/backup'))
set backupdir=$HOME/.cache/vim/backup "backup 文件存放位置
call GuardExistDirectory(expand('$HOME/.cache/vim/swp'))
set directory=$HOME/.cache/vim/swp

" set signcolumn=number
" set pythonthreedll=/opt/homebrew/Frameworks/Python.framework/Versions/Current/Python
" set pythonthreehome=/opt/homebrew/Frameworks/Python.framework/Versions/Current
set mouse+=a "保证行号不被复制
set visualbell "错误时不发出声音, 只显示在屏幕上
set ttimeout        "time out for key codes
set ttimeoutlen=10  "wait up to 20ms after Esc for special key(default 1s)
set switchbuf+=usetab,newtab

"=======================   File   =======================
set fileformat=unix "保存文件的格式为 unix
set fileformats=unix,mac,dos
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set encoding=utf-8 "UTF-8 支持
scriptencoding utf-8
set termencoding=utf-8
set fileencoding=utf-8 "编码方式为 utf-8
set updatetime=100
" set autochdir "自动将当前编辑文件的路径变为工作目录(比如用于 args 批量操作)
" set autowriteall "类似 autowrite, 但是在文件关闭, 切换等场景上会自动触发保存, 本项设置后相当于开启了 autowrite
if isdirectory(expand('$XDG_DATA_HOME/share/header'))
    set path+=$XDG_DATA_HOME/share/header/** "头文件搜索目录, 非 $PATH
endif

" let s:llvm_path = expand('$HOMEBREW_PREFIX/opt/llvm/bin')
" if isdirectory(s:llvm_path)
"     let $PATH=s:llvm_path.':'.$PATH
" endif

"=======================   Search   =============================
set hlsearch "搜索结果高亮
set incsearch "搜索时输入内容时立刻进行搜索
set ignorecase "查找时忽略大小写
set smartcase "搜索时只有输入大写字母时才会强制符合大小写, 需要与 ignorecase 一同设置才能正常工作
set showmatch "匹配括号

"=======================   Indent   =========================
set backspace=2 "Backspace 键是否可以删除字符
set autoindent "自动缩进, 需要与 smartindent 配合使用才有效果
set smartindent "智能缩进, 在进行代码编写的时候会智能判断缩进距离, 与 autoindent 配合使用
set smarttab
set shiftwidth=4 "设置缩进的字符数, 与 tabstop 不同, 这个是系统进行自动缩进时会使用的值
set tabstop=4 "按下一次 tab 键缩进的距离, 不代表空格或制表符
set expandtab "缩进使用空格代表, 如果要使用制表符可以改为 noexpandtab, 设置后旧文件仍然采用之前的 tab 格式, 可以使用`%retab!`强制转换为新tab 格式

"=======================   Appearance   ============================
syntax on "设置语法高亮
"set termguicolors "true colors for vim in terminal
set number "显示行号
set wildmenu "输入部分命令按下 tab 键可以弹出符合的命令列表
set wildmode=full
set showcmd "右下角显示正在操作的命令
" set cmdheight=2
set list "设置显示行尾, 换行, 制表符等隐藏字符
set listchars=tab:▸-,eol:↩︎,trail:-,space:⋅ "自定义换行, 制表符等显示格式
set laststatus=2 "必须设置, 否则 lightline 不能正确显示

set hidden  " 允许在未保存 buffer 的时候切换至另一个 buffer
set noshowmode "隐藏vim 的默认提示当前状态信息, eg. 在状态栏下显示'insert', 'replace'等信息
set t_Co=256 "Vim 能显示的颜色数
set shortmess-=S "显示当前搜索的结果数量及当前位置
set nofoldenable
set relativenumber
set completeopt=longest,menuone " popup:展示补全列表的侧边窗口
if has('textprop')
    set completeopt+=popup
endif
if has('textprop') && has('quickfix')
    set completepopup=align:menu,border:off,highlight:WildMenu " 调整侧边窗口的样式
endif
set cursorline "突出光标所在行, 开启后速度变慢
" set scrolloff=1 "设置光标距离最顶(底)部的距离不小于 1 行(一旦小于 1 行即触发位于下方的 scrolljump)
" set scrolljump=5 "光标移动到底部时自动向下翻动 5 行
set signcolumn=yes
set textwidth=150
set formatoptions-=croql
let filetype_m='objc'
" let filetype_mm='objc'

" set cursorcolumn "突出光标所在列, 开启后速度变慢
" set linespace=16 "设置行间距
" set showtabline=2 "始终显示窗口上头的 tabline
" set foldmethod=syntax
" set foldnestmax=10
" set foldlevel=2

"███████████████████████   Source Load File   ██████████████████████████

"=======================   Plugin   ============================
call Source('$VIMCONFIG/main/plugin.vim')

"=======================   Function   ============================
call Source('$VIMCONFIG/main/function.vim')

"=======================   Keymap   ============================
call Source('$VIMCONFIG/main/keymap.vim')

"=======================   Command   ============================
call Source('$VIMCONFIG/main/command.vim')

"=======================   Appearance   ============================
call Source('$VIMCONFIG/main/appearance.vim')

"=======================   Auto   ============================
call Source('$VIMCONFIG/main/autocmd.vim')
