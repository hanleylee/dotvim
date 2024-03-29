" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('fzf.vim')
    finish
endif

" let g:fzf_preview_window = 'right:60%'
let g:fzf_buffers_jump = 1 " [Buffers] Jump to the existing window if possible
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"' " [[B]Commits] Customize the options used by 'git log'
let g:fzf_files_options = '--preview "rougify {2..} | head -'.&lines.'"'
let g:fzf_tags_command = 'ctags -R' " [Tags] Command to generate tags file
let g:fzf_commands_expect = 'alt-enter,ctrl-x' " [Commands] --expect expression for directly executing the command
let g:fzf_preview_window = ['right:50%:hidden:nowrap', '?']
" Empty value to disable preview window altogether
" let g:fzf_preview_window = []

" `g:fzf_action`, `g:fzf_layout`, `g:fzf_colors`, `g:fzf_history_dir` will be used in `fzf#wrap()`
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit',
            \ 'ctrl-s': 'FzfFilesWithFilePath',
            \ 'alt-bs': 'FzfPreLevel',
            \}


func s:enter_file_root(file)
    " call fzf#run(fzf#wrap('ls', {'source': 'ls', 'dir': '/Users/hanley/.vim'}))
    let dir = fnamemodify(a:file, ':p:h')
    call fzf#vim#files(dir, fzf#vim#with_preview())
endfunction

if has('popupwin') || has('nvim')
    " let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8, 'relative': v:true } }
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
else
    let g:fzf_layout = { 'down': '~60%' }
endif
" let g:fzf_colors =
"             \ {
"                 \ 'fg':      ['fg', 'Normal'],
"                 \ 'bg':      ['bg', 'Normal'],
"                 \ 'hl':      ['fg', 'Comment'],
"                 \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
"                 \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
"                 \ 'hl+':     ['fg', 'Statement'],
"                 \ 'info':    ['fg', 'PreProc'],
"                 \ 'border':  ['fg', 'Ignore'],
"                 \ 'prompt':  ['fg', 'Conditional'],
"                 \ 'pointer': ['fg', 'Exception'],
"                 \ 'marker':  ['fg', 'Keyword'],
"                 \ 'spinner': ['fg', 'Label'],
"                 \ 'header':  ['fg', 'Comment']
"                 \ }
" let g:fzf_history_dir = '~/.local/share/fzf-history' " 使用之后 c-n, c-p 就是前后命令的意思, 不好

