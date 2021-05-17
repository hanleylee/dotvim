"********************   vim-signify   ***************************
let g:signify_realtime = 0
let g:signify_vcs_list = [ 'git', 'hg' ]
let g:signify_update_on_bufenter = 1
let g:signify_skip_filetype = { '***': 1 }
let g:signify_skip_filename = { '/home/user/.vimrc': 1 }
let g:signify_skip_filename_pattern = [ 'foo.*bar', 'tmp' ]
let g:signify_vcs_cmds = {
            \ 'git': 'git diff --no-color --no-ext-diff -U0 -- %f',
            \ 'svn': 'svn diff --diff-cmd %d -x -U0 -- %f'
            \ }
