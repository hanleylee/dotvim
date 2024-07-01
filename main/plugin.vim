" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

"███████████████████████   插件   ██████████████████████████
" vim-plug 插件管理工具使用命令
" :PlugInstall    -  安装插件
" :PlugUpdate     -  更新插件
" :PlugUpgrade    -  更新 vim-plug 本身
" :PlugClean      -  清理不使用的插件

" branch/tag/commit Branch/tag/commit of the repository to use
" rtp               Subdirectory that contains Vim plugin
" dir               Custom directory for the plugin
" as                Use different name for the plugin
" do                Post-update hook (string or funcref)
" on                On-demand loading: Commands or <Plug>-mappings
" for               On-demand loading: File types
" frozen            Do not update unless explicitly specified

" 如果现在处于测试状态, 那么只加载需要测试的插件
if !empty($VIMTEST)
    call plug#begin('$HOME/.vim/plugged')

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " 模糊搜索
    Plug 'junegunn/fzf.vim'                             " 模糊搜索
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    call plug#end()
    finish
endif

func s:load_debug_plug(name, load_local, ...)
    let args = a:0 > 1 ? a:1 : {}

    if a:load_local
        let args['dir'] = g:vim_debug_root . a:name
    endif
    Plug a:name, args
endfunction

call plug#begin('$HOME/.vim/plugged')
let s:vim_weight = get(g:, 'vim_weight', '1') " 默认值给1, 当使用 vim 直接进入时就是( vim = v1 )

" MARK: level v0, load 0 plugin, only basic vim original configuration {{{
if s:vim_weight >= 0
endif
" }}}

" MARK: level v1, only for fast browse {{{
if s:vim_weight >= 1 || g:is_in_gui
    " ============= File Management =============
    Plug 'lambdalisue/fern.vim', { 'on': 'Fern' }
    Plug 'lambdalisue/fern-hijack.vim', { 'on': 'Fern' }
    Plug 'lambdalisue/nerdfont.vim', { 'on': 'Fern' }
    Plug 'lambdalisue/glyph-palette.vim'
    Plug 'lambdalisue/fern-renderer-nerdfont.vim', { 'on': 'Fern' }
    Plug 'lambdalisue/fern-git-status.vim', { 'on': 'Fern' }
    Plug 'LumaKernel/fern-mapping-fzf.vim', { 'on': 'Fern' }

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " 模糊搜索
    Plug 'junegunn/fzf.vim'                             " 模糊搜索
    Plug 'airblade/vim-rooter'
    Plug 'mhinz/vim-startify'              " 首页显示
    Plug 'ryanoasis/vim-devicons'          " 显示文件类型图标

    " ============= Appearance ============
    Plug 'itchyny/lightline.vim'         " 显示底部导航栏
    if has('conceal')
        Plug 'Yggdroot/indentLine'           " 显示缩进线
    endif
    Plug 'andymass/vim-matchup'          " 高亮括号
    Plug 'hanleylee/vim-togglecursor' ", {'dir': '$HL_REPO/vim/vim-togglecursor'}

    " ============== Function ==============
    Plug 'tpope/vim-unimpaired'     " useful keymaps
    Plug 'tpope/vim-fugitive'       " git operation
    Plug 'tpope/vim-rhubarb'        " browse code on github, GBrowse
    " Plug 'tpope/vim-projectionist'  " 在头文件与本文件之间跳转
    Plug 'rhysd/conflict-marker.vim'
    Plug 'skywind3000/vim-preview'
    Plug 'ojroques/vim-oscyank', {'branch': 'main'}
    Plug 'hanleylee/vim-alternate' " , {'dir': '$HL_REPO/vim/vim-alternate'}
    Plug 'skywind3000/vim-dict'
    if has('terminal')
        Plug 'voldikss/vim-floaterm'
    endif

    "============== Language ==============
    Plug 'octol/vim-cpp-enhanced-highlight' " cpp
    Plug 'vim-ruby/vim-ruby'        " ruby
    Plug 'keith/swift.vim'          " swift
    Plug 'vim-python/python-syntax' " python
    Plug 'dart-lang/dart-vim-plugin' " dart
    Plug 'mityu/vim-applescript'    " applescript
    " Plug 'nathangrigg/vim-beancount'
    Plug 'neoclide/jsonc.vim' " jsonc
    Plug 'chrisbra/csv.vim'   " csv
    Plug 'fladson/vim-kitty'  " kitty
    Plug 'aklt/plantuml-syntax' " plantuml
    Plug 'udalov/kotlin-vim'  " kotlin
    Plug 'cespare/vim-toml'   " toml
    Plug 'pboettch/vim-cmake-syntax' " cmake
    " Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
    Plug 'hail2u/vim-css3-syntax'       " for css
    Plug 'othree/html5.vim'             " for html
    Plug 'pangloss/vim-javascript'      " for javascript
    Plug 'arzg/vim-rust-syntax-ext'     " for rust
    Plug 'compnerd/arm64asm-vim'        " for arm64
    Plug 'HerringtonDarkholme/yats.vim' " for ts
    Plug 'guns/vim-sexp'
    Plug 'martinda/Jenkinsfile-vim-syntax' " for Jenkinsfile
    Plug 'thecodesmith/vim-groovy'      " for groovy
    " Plug 'peterhoeg/vim-qml'
    Plug 'hanleylee/vim-gitignore' " , {'dir': '$HL_REPO/vim/vim-gitignore'}
    Plug 'hanleylee/vim-taskpaper' , {'dir': '$HL_REPO/vim/vim-taskpaper'}
    Plug 'hanleylee/vim-markdown' " , {'dir': '$HL_REPO/vim/vim-markdown'}
    " Plug 'preservim/vim-markdown'
    " Plug 'tpope/vim-markdown'
endif
" }}}

" MARK: level v2, edit {{{
if s:vim_weight >= 2 || g:is_in_gui
    " ============= Edit ===========
    Plug 'kshenoy/vim-signature'                        " marks 管理插件
    if !g:is_in_kitty " xterm-kitty 下此插件有异常, 应该是 vim 的原因
        Plug 'jiangmiao/auto-pairs'                         " 匹配括号
    endif
    Plug 'tpope/vim-commentary'                         " comment code quickly, gcc
    Plug 'tpope/vim-repeat'                             " repeat last operation
    Plug 'tpope/vim-surround'                           " operate surrounding characters
    Plug 'tpope/vim-eunuch'                             " Delete Move Rename Chmoe Mkdir SudoEdit SudoWrite
    Plug 'tpope/vim-dadbod'                             " interactive database operation
    Plug 'tpope/vim-speeddating'                        " use <C-A> / <C-X> quicky increase / decrease date
    Plug 'tpope/vim-sexp-mappings-for-regular-people'   " support 'dsf', 'cse(', 'cse)', 'cseb', 'cse[', 'cse]', 'cse{', 'cse}', '<M-h>', '<M-l>', '>f', '<f', '>e', '<e', '>)', '<)', '>(', '<(', '<I', '>I'
    " Plug 'machakann/vim-sandwich'
    Plug 'kristijanhusak/vim-dadbod-ui'
    Plug 'tommcdo/vim-exchange'                         " 快速交换两个单词, cxia, cxx, X, cxc
    Plug 'kana/vim-textobj-user'                        " base text object plugin for below
    Plug 'kana/vim-textobj-indent'                      " *ai, *ii
    Plug 'kana/vim-textobj-fold'                        " *az, *iz
    Plug 'kana/vim-textobj-line'                        " *al, *il
    Plug 'kana/vim-textobj-syntax'                      " *ay, *iy
    Plug 'kana/vim-textobj-entire'                      " *ae, *ie
    " i, I, a, A, in, In, il, Il, an, An, al, Al, num+...
    " (, ), {, }, B, <, >, t, ', ", `, \,, ., ;, :, +, -, =, ~, _, *, #, /, |, \, &, $, b, a, q
    " 'https://hanleylee.com'
    " see cheat sheet: https://github.com/wellle/targets.vim/blob/master/cheatsheet.md
    Plug 'wellle/targets.vim'
    Plug 'hanleylee/vim-blockmove'  , {'dir': '$HL_REPO/vim/vim-blockmove'}
    " Plug 'matze/vim-move'
    " Plug 'atweiden/vim-dragvisuals'
    Plug 'godlygeek/tabular'                            " 文本对齐, 使用 :Tabularize /= 可以等号对齐多行
    Plug 'lyokha/vim-xkbswitch', {'as': 'xkbswitch'}    " 返回到 normal 模式时快速切换为英文输入法
    Plug 'dhruvasagar/vim-table-mode'                   " 自动表格, 使用`\tm` 就进入了表格模式, 会进行自动对齐
    Plug 'dyng/ctrlsf.vim'                              " 批量搜索替换
    Plug 'mg979/vim-visual-multi'                       " 多选
    Plug 'bootleq/vim-cycle'                            " yes => no => yes, January => February => March, trUe => faLse, ' => '', <em>important</em> => <strong>important</strong>

    " ============= Appearance ============
    Plug 'airblade/vim-gitgutter'          " 栏侧显示每行的 git 修改状态

    " ============== Function ==============
    Plug 'simnalamburt/vim-mundo'                   " show operation history for undo
    Plug 'Chiel92/vim-autoformat'                   " 自动格式化文档
    Plug 'hanleylee/vim-t2s', { 'on': ['T2S', 'S2T'] } " , {'dir': '$HL_REPO/vim/vim-t2s'}
    Plug 'hanleylee/vim-cocoapods' " , {'dir': '$HL_REPO/vim/vim-cocoapods'}
    Plug 'mattn/emmet-vim'
    Plug 'romainl/vim-qf'
    Plug 'easymotion/vim-easymotion'                    " 空格任意跳转
endif
" }}}

" MARK: level3, heaviest, add completion & debugger on previous feature {{{
if s:vim_weight >= 3 || g:is_in_gui
    " ============= Completion ===========
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'neoclide/coc.nvim', {'tag': 'v0.0.82', 'do': 'yarn install --frozen-lockfile'}
    " Plug 'neoclide/coc.nvim', {'branch': 'release', 'commit': '968e9a25e32e1cdb362a9894a96e038b3c1be0c9'}
    " Plug 'neoclide/coc.nvim', {'branch': 'release', 'commit': 'cc48178cb7a827b40b50b804fe1d3c4671ad1126'}
    " Plug 'neoclide/coc.nvim', {'branch': 'master', 'commit': '2ad659d8b1a3d7bef7dca7d33c6ab9363a729100', 'do': 'yarn install --frozen-lockfile'}
    " Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
    " Plug 'hanleylee/coc-gitcomp', {'dir': '$HL_REPO/vim/coc-gitcomp'}
    Plug 'hanleylee/coc-gitcomp', {'do': 'yarn install'}
    Plug 'ludovicchabant/vim-gutentags'                 " 根据 ctags 或 gtags 生成 tags 进行使用, 自动管理
    Plug 'skywind3000/gutentags_plus'                   " 提供 cs 相关快捷键及多项目切换自动断开数据库功能

    " ============== Function ==============
    Plug 'hanleylee/vim-renamer' ", {'dir': '$HL_REPO/vim/vim-renamer'}
    Plug 'hanleylee/vim-asciiart' ", {'dir': '$HL_REPO/vim/vim-asciiart'}
    " Plug 'vim-scripts/DrawIt', {'for': 'asciiart'} " for debug
    " Plug 'gyim/vim-boxdraw' 
    Plug 'skywind3000/vim-quickui'
    Plug 'tpope/vim-scriptease'   " tool for script expert
    Plug 'tpope/vim-characterize' " enhance ga
    " Plug 'puremourning/vimspector' " for debug
    Plug 'liuchengxu/vista.vim' " display symbols in sidebar on the right
    Plug 'chrisbra/Colorizer' " highlight color for css / html filetype
    Plug 'markonm/traces.vim' " pattern preview for 'substitute', 'global', 'vglobal', 'sort'
    Plug 'alker0/chezmoi.vim' " chezmoi syntax and keymap

    " ============== Run ==============
    Plug 'skywind3000/asyncrun.vim'                 " 异步执行
    Plug 'skywind3000/asynctasks.vim'
    Plug 'sillybun/vim-repl'
    Plug 'weirongxu/plantuml-previewer.vim'
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
    Plug 'tyru/open-browser.vim'
    Plug 'tyru/open-browser-unicode.vim'
    Plug 'tyru/open-browser-github.vim'
    Plug 'tamago324/vim-browsersync' " preview html

    " ============= Test ==============
    Plug 'vim-test/vim-test'
    Plug 'thinca/vim-themis'

    " ============= Else ==============
    " Plug 'skanehira/christmas.vim'
    " Plug 'tomtom/tlib_vim'
else
    Plug 'skywind3000/vim-auto-popmenu'
    Plug 'skywind3000/vim-gpt-commit'
endif
" }}}

call plug#end()

"============== UNUSED ================ {{{
" Plug 'machakann/vim-highlightedyank' " 使 yank 的文档半透明高亮
" Plug 'machakann/vim-Verdin'     " vim 语法补全
" Plug 'dense-analysis/ale'                           " 提示语法错误
" Plug 'Shougo/echodoc.vim'

" Plug 'tpope/vim-apathy'
" Plug 'MFreidank/AnkiVim'
" Plug 'wincent/terminus'         " 更好的终端
" Plug 'gisphm/vim-gitignore'
" Plug 'tpope/vim-git'
" Plug 'fszymanski/fzf-gitignore'
" Plug 'bfrg/vim-cpp-modern'
" Plug 'sjl/vitality.vim' "光标形状改变
" Plug 'elzr/vim-json'
" Plug 'ianding1/leetcode.vim'
" Plug 'tenfyzhong/CompleteParameter.vim' Plug 'hotoo/pangu.vim'
" Plug 'instant-markdown/vim-instant-markdown', {'for': 'markdown', 'do': 'yarn install'}
" Plug 'justinmk/vim-dirvish'
" Plug 'skywind3000/vim-terminal-help'
" Plug 'yianwillis/vimcdoc'
" Plug 'elzr/vim-json'
" Plug 'jszakmeister/markdown2ctags'   " markdown 层级显示
" Plug 'vim-pandoc/vim-pandoc'
" Plug 'Yggdroot/hiPairs'
" Plug 'embear/vim-localvimrc'                        " 用于针对工程设置 vimrc
" Plug 'sheerun/vim-polyglot'          " 会改变文件格式的 shiftwidth, 会动态判断 ft, 其禁用机制很麻烦
" Plug 'tweekmonster/startuptime.vim'
" Plug 'zxqfl/tabnine-vim'               " 补全
" Plug 'junegunn/goyo.vim'               " 专注于写作的插件, 不适用写代码!
" Plug 'junegunn/seoul256.vim'           " Vim 配色(韩国人审美)
" Plug 'Yggdroot/hiPairs'                " 高亮匹配的括号
" Plug 'junegunn/limelight.vim'          " 暗光效果插件, 与 Goyo 联动配合使用效果最佳
" Plug 'nathanaelkane/vim-indent-guides' " 缩进线显示
" Plug 'scrooloose/syntastic'            " 语法错误检查
" Plug 'Yggdroot/LeaderF'                " 快速搜索文件
" Plug 'preservim/nerdcommenter'         " 快速注释某行
" Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
" Plug 'sgur/vim-textobj-parameter'
" Plug 'michaeljsmith/vim-indent-object'
" Plug 'mhinz/vim-signify'             " 显示当前行的 git 状态
" Plug 'terryma/vim-multiple-cursors'                 " 多行文本操作
" Plug 'google/vim-searchindex'
" Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
" Plug 'tpope/vim-markdown'
" Plug 'rbgrouleff/bclose.vim'
" Plug 'ap/vim-css-color'              " 显示 css 颜色
" Plug 'RRethy/vim-hexokinase'
" Plug 'ajmwagar/vim-deus'
" Plug 'lifepillar/vim-solarized8'
" Plug 'sainnhe/edge'
" Plug 'sainnhe/sonokai'
" Plug 'shaunsingh/nord.nvim'
" Plug 'NTBBloodbath/doom-one.nvim
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'justinmk/vim-sneak'
" Plug 'benknoble/gitignore-vim'
" Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
" Plug 'skywind3000/vim-terminal-help'
" Plug 'skywind3000/vim-auto-popmenu'
" Plug 'ianva/vim-youdao-translater'
" Plug 'luochen1990/rainbow'           " 高亮括号
" Plug 'bronson/vim-visual-star-search'               " 使用 * 搜索选中的单词
" Plug 'preservim/nerdtree'
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'tpope/vim-vinegar'
" Plug 'vim-scripts/argtextobj.vim'                   " *aa, *ia
" Plug 'honza/vim-snippets'
" Plug 'ycm-core/YouCompleteMe'        " 补全插件
" Plug 'chrisbra/NrrwRgn'   " inline_edit 已经实现了
" Plug 'vitalk/vim-shebang'
" Plug 'equalsraf/neovim-gui-shim'
" Plug 'SirVer/ultisnips'                             " 自定义某些片段
" Plug 'plasticboy/vim-markdown'
" Plug 'tpope/vim-markdown'
" Plug 'lfilho/cosco.vim'
" Plug 'dhruvasagar/vim-dotoo'
" Plug 'AndrewRadev/splitjoin.vim' " gS to split a one-liner into multiple lines, gJ to join a block into a single-line statement
" Plug 'dstein64/vim-startuptime'
" Plug 'othree/eregex.vim'
" Plug 'zhimsel/vim-stay'         " 恢复之前的光标折叠等
" Plug 'szw/vim-maximizer'
" Plug 'rizzatti/dash.vim'
" Plug 'junegunn/gv.vim'          " browse git log
" Plug 'Konfekt/FastFold'         " 在编辑中尽可能的减少折叠次数(通过修改 set local foldmethod=munual 实现)
" Plug 'tmhedberg/SimpylFold'     " 帮助折叠 python 文件
" Plug 'rhysd/vim-grammarous' " GrammarousCheck
" Plug 'AndrewRadev/inline_edit.vim'              " 可以在 markdown 内编写代码片段
" Plug 'Chandlercjy/vim-markdown-edit-code-block'              " 可以在 markdown 内编写代码片段
"}}}
