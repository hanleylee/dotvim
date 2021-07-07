" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

"███████████████████████   插件   ██████████████████████████
"vim-plug 插件管理工具使用命令
" :PlugInstall    -  安装插件
" :PlugUpdate     -  更新插件
" :PlugUpgrade    -  更新 vim-plug 本身
" :PlugClean      -  清理不使用的插件

call plug#begin('$HOME/.vim/plugged')

let s:vim_weight = get(g:, 'vim_weight', '1') " 默认值给1, 当使用 vim 直接进入时就是( vim = v1 )

" MARK: level v0, load 0 plugin, only basic vim original configuration
if s:vim_weight >= 0
endif

" MARK: level v1, only for fast browse
if s:vim_weight >= 1 || has('gui_running')
    " ============= File Management =============
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " 模糊搜索
    Plug 'junegunn/fzf.vim'                             " 模糊搜索
    Plug 'airblade/vim-rooter'

    " ============= Edit ===========
    Plug 'bronson/vim-visual-star-search'               " 使用 * 搜索选中的单词
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-unimpaired'
    Plug 'ojroques/vim-oscyank'

    " ============= Appearance ============
    Plug 'joshdick/onedark.vim'
    " Plug 'morhetz/gruvbox'
    Plug 'itchyny/lightline.vim'         " 显示底部导航栏
    Plug 'octol/vim-cpp-enhanced-highlight'
    Plug 'Yggdroot/indentLine'           " 显示缩进线
    Plug 'andymass/vim-matchup'          " 高亮括号
    Plug 'ap/vim-css-color'              " 显示 css 颜色

    " ============== Function ==============
    Plug 'tpope/vim-fugitive'       " git 插件
    Plug 'tpope/vim-rhubarb'        " browse code on github
    Plug 'junegunn/gv.vim'          " browse git log
    Plug 'simnalamburt/vim-mundo'   " 显示修改历史
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'skywind3000/vim-preview'

    "============== Language ==============
    Plug 'plasticboy/vim-markdown'
    Plug 'nathangrigg/vim-beancount'
    Plug 'neoclide/jsonc.vim' " 设置 jsonc 格式, 可以添加注释
    Plug 'szw/vim-maximizer'
    Plug '$VIMCONFIG/HanleyLee/vim-alternate'
    " Plug '$VIMCONFIG/HanleyLee/potion'
endif

" MARK: level v2, edit
if s:vim_weight >= 2 || has('gui_running')
    " ============= Edit ===========
    Plug 'kshenoy/vim-signature'                        " signature 插件
    Plug 'jiangmiao/auto-pairs'                         " 匹配括号
    Plug 'tpope/vim-commentary'                         " 快速注释, gcc
    Plug 'tpope/vim-repeat'                             " 支持重复
    Plug 'tpope/vim-surround'                           " 包围符号
    Plug 'tommcdo/vim-exchange'                         " 快速交换两个单词, cxia
    Plug 'michaeljsmith/vim-indent-object'
    Plug 'kana/vim-textobj-entire'
    Plug 'easymotion/vim-easymotion'                    " 空格任意跳转
    Plug 'godlygeek/tabular'                            " 文本对齐, 使用 :Tabularize /= 可以等号对齐多行
    Plug 'lyokha/vim-xkbswitch', {'as': 'xkbswitch'}    " 返回到 normal 模式时快速切换为英文输入法
    Plug 'dhruvasagar/vim-table-mode'                   " 自动表格, 使用`\tm` 就进入了表格模式, 会进行自动对齐
    Plug 'terryma/vim-multiple-cursors'                 " 多行文本操作

    " ============= Appearance ============
    Plug 'mhinz/vim-signify'             " 显示当前行的 git 状态
    Plug 'jszakmeister/vim-togglecursor' "改变 cursor 形状

    " ============== Function ==============
    Plug 'liuchengxu/vista.vim'
    Plug 'jiazhoulvke/jianfan'      " 简繁转换 Tcn, Scn
    Plug 'AndrewRadev/inline_edit.vim' "可以在 markdown 内编写代码片段
    Plug 'qpkorr/vim-renamer'       " 批量修改文件的神器, 使用 :Ren 进行编辑与保存, 完成后退出即可
    Plug 'Chiel92/vim-autoformat'   " 自动格式化文档
    Plug 'skywind3000/asyncrun.vim' " 异步执行
    Plug 'skywind3000/asynctasks.vim'
    Plug 'skywind3000/vim-quickui'
endif

" MARK: level3, heaviest, add completion & debugger on previous feature
if s:vim_weight >= 3 || has('gui_running')
    " ============= Completion ===========
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'honza/vim-snippets'
    Plug 'ludovicchabant/vim-gutentags'                 " 根据 ctags 或 gtags 生成 tags 进行使用, 自动管理
    Plug 'skywind3000/gutentags_plus'                   " 提供 cs 相关快捷键及多项目切换自动断开数据库功能
    Plug 'puremourning/vimspector'
    Plug 'tpope/vim-scriptease'
    Plug 'sillybun/vim-repl'
endif

call plug#end()

"============== UNUSED ================
" Plug 'ycm-core/YouCompleteMe'        " 补全插件
" Plug 'SirVer/ultisnips'                             " 自定义某些片段
" Plug 'machakann/vim-highlightedyank' " 使 yank 的文档半透明高亮
" Plug 'machakann/vim-Verdin'     " vim 语法补全
" Plug 'dense-analysis/ale'                           " 提示语法错误
" Plug 'Shougo/echodoc.vim'

" Plug 'tpope/vim-apathy'
" Plug 'keith/swift.vim'
" Plug 'MFreidank/AnkiVim'
" Plug 'wincent/terminus'         " 更好的终端
" Plug 'gisphm/vim-gitignore'
" Plug 'benknoble/gitignore-vim'
" Plug 'tpope/vim-git'
" Plug 'tpope/vim-projectionist'        " 在头文件与本文件之间跳转
" Plug 'fszymanski/fzf-gitignore'
" Plug 'bfrg/vim-cpp-modern'
" Plug 'sjl/vitality.vim' "光标形状改变
" Plug 'elzr/vim-json'
" Plug 'ianding1/leetcode.vim'
" Plug 'tenfyzhong/CompleteParameter.vim'
" Plug 'hotoo/pangu.vim'
" Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
" Plug 'justinmk/vim-dirvish'
" Plug 'skywind3000/vim-terminal-help'
" Plug 'yianwillis/vimcdoc'
" Plug 'elzr/vim-json'
" Plug 'majutsushi/tagbar'        " 显示文档的层级
" Plug 'jszakmeister/markdown2ctags'   " markdown 层级显示
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'Yggdroot/hiPairs'
" Plug 'embear/vim-localvimrc'                        " 用于针对工程设置 vimrc
" Plug 'sheerun/vim-polyglot'          " 会改变文件格式的 shiftwidth, 会动态判断 ft, 其禁用机制很麻烦
" Plug 'ryanoasis/vim-devicons'        " 显示文件类型图标
" Plug 'luochen1990/rainbow'           " 高亮括号
" Plug 'tweekmonster/startuptime.vim'
" Plug 'zxqfl/tabnine-vim'               " 补全
" Plug 'junegunn/goyo.vim'               " 专注于写作的插件, 不适用写代码!
" Plug 'junegunn/seoul256.vim'           " Vim 配色(韩国人审美)
" Plug 'Yggdroot/hiPairs'                " 高亮匹配的括号
" Plug 'junegunn/limelight.vim'          " 暗光效果插件, 与 Goyo 联动配合使用效果最佳
" Plug 'nathanaelkane/vim-indent-guides' " 缩进线显示
" Plug 'airblade/vim-gitgutter'          " 栏侧显示每行的 git 修改状态
" Plug 'scrooloose/syntastic'            " 语法错误检查
" Plug 'Yggdroot/LeaderF'                " 快速搜索文件
" Plug 'preservim/nerdcommenter'         " 快速注释某行
" Plug 'mhinz/vim-startify'              " 首页显示
" Plug 'kana/vim-textobj-user'
" Plug 'kana/vim-textobj-indent'
" Plug 'kana/vim-textobj-syntax'
" Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
" Plug 'sgur/vim-textobj-parameter'
