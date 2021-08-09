" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('vim-gutentags')
    finish
endif

" gutentags 搜索工程目录的标志, 当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = g:hl_rootmarkers
let g:gutentags_add_default_project_roots = 0
let g:gutentags_exclude_project_root = ['/usr/local', '/opt/homebrew']
let g:gutentags_background_update = 1
let g:gutentags_exclude_filetypes = [
            \'gitcommit', 
            \'gitconfig', 
            \'gitrebase', 
            \'gitsendemail', 
            \'git', 
            \'netrw',
            \]
let g:gutentags_ctags_exclude = [
            \  '*.git', '*.svn', '*.hg',
            \  'cache', 'build', 'dist', 'bin', 'node_modules', 'bower_components',
            \  'plugged', 'Pods',
            \  '*-lock.json',  '*.lock',
            \  '*.min.*',
            \  '*.bak',
            \  '*.zip',
            \  '*.pyc',
            \  '*.class',
            \  '*.sln',
            \  '*.csproj', '*.csproj.user',
            \  '*.tmp',
            \  '*.cache',
            \  '*.vscode',
            \  '*.pdb',
            \  '*.exe', '*.dll', '*.bin',
            \  '*.mp3', '*.ogg', '*.flac',
            \  '*.swp', '*.swo',
            \  '.DS_Store', '*.plist',
            \  '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png', '*.svg',
            \  '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
            \  '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx', '*.xls',
            \]
let g:gutentags_ctags_tagfile = '.tags' "所生成的数据文件的名称
let g:gutentags_modules = [] "同时开启 ctags 和 gtags 支持:

if executable('ctags')
    let g:gutentags_modules += ['ctags']
endif

if executable('gtags-cscope') && executable('gtags')
    let g:gutentags_modules += ['gtags_cscope']
endif

let s:vim_tags = expand('~/.cache/tags')
call GuardExistDirectory(s:vim_tags)
let g:gutentags_cache_dir = s:vim_tags "将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中

"配置 ctags 的参数, 老的 Exuberant-ctags 不能有 --extra=+q, 注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extras=+q']
"l 表示local variable, 不是大写的 I
let g:gutentags_ctags_extra_args += ['--c++-kinds=+pxl']
let g:gutentags_ctags_extra_args += ['--c-kinds=+pxl']
"如果使用 universal ctags 需要增加下面一行, 老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags'] 
let g:gutentags_auto_add_gtags_cscope = 0 " 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_generate_on_new = 1
let g:gutentags_generate_on_missing = 1
let g:gutentags_generate_on_write = 1
let g:gutentags_generate_on_empty_buffer = 0
let g:gutentags_define_advanced_commands = 1
" let g:gutentags_trace = 1 "将此选项打开, 发生错误后再使用 messages 查看出错的原因
let g:gutentags_plus_switch = 1
