" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('vim-signify')
    finish
endif

let g:signify_disable_by_default = 0

let g:signify_realtime = 0
let g:signify_line_highlight = 0
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_update_on_bufenter = 1

let g:signify_skip_filetype = { '***': 1 }
let g:signify_skip_filename = { '/home/user/.vimrc': 1 }
let g:signify_skip_filename_pattern = [ 'foo.*bar', 'tmp' ]

let g:signify_vcs_cmds = {
            \ 'git': 'git diff --no-color --no-ext-diff -U0 -- %f',
            \ 'svn': 'svn diff --diff-cmd %d -x -U0 -- %f'
            \ }

g:signify_vcs_cmds_diffmode

let g:signify_sign_add = '+'
let g:signify_sign_delete = '_'
let g:signify_sign_delete_first_line = '-'
let g:signify_sign_change = '~'
let g:signify_sign_change_delete = g:signify_sign_change . g:signify_sign_delete_first_line
let g:signify_sign_show_count = 1

let g:signify_difftool = 'diff'
let g:signify_fold_context = [3, 8]
let g:signify_priority = 10
