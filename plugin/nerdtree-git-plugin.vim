" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('nerdtree-git-plugin')
    finish
endif

let g:NERDTreeGitStatusEnable = 1
let g:NERDTreeGitStatusUseNerdFonts = 0 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0
let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too. default: normal
let g:NERDTreeGitStatusGitBinPath = 'git' " default: git (auto find in path)
let g:NERDTreeGitStatusShowClean = 0 " default: 0
let g:NERDTreeGitStatusDirDirtyOnly = 1
let g:NERDTreeGitStatusAlignIfConceal = 1
let g:NERDTreeGitStatusUpdateOnCursorHold = 1
let g:NERDTreeGitStatusUpdateOnWrite = 1
let g:NERDTreeGitStatusLogLevel = 2
let g:NERDTreeGitStatusMapNextHunk = ']h'
let g:NERDTreeGitStatusMapPrevHunk = '[h'
let g:NERDTreeGitStatusPorcelainVersion = 2
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0, DO NOT enable this feature if you have also installed vim-devicons.
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
