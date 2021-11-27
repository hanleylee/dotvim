" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('fern-git-status.vim')
    finish
endif
" Disable listing ignored files/directories
let g:fern_git_status#disable_ignored = 0

" Disable listing untracked files
let g:fern_git_status#disable_untracked = 0

" Disable listing status of submodules
let g:fern_git_status#disable_submodules = 0

" Disable listing status of directories
let g:fern_git_status#disable_directories = 0
