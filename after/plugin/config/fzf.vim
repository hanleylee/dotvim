" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('fzf.vim')
    finish
endif

" let g:fzf_preview_window = 'right:60%'
let g:fzf_buffers_jump = 1 " [Buffers] Jump to the existing window if possible
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"' " [[B]Commits] Customize the options used by 'git log'
let g:fzf_files_options = '--preview "rougify {2..} | head -'.&lines.'"'
let g:fzf_tags_command = 'ctags -R' " [Tags] Command to generate tags file
let g:fzf_commands_expect = 'alt-enter,ctrl-x' " [Commands] --expect expression for directly executing the command
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit'
            \}
if has('popupwin') || has('nvim')
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
else
    let g:fzf_layout = { 'down': '~60%' }
endif

