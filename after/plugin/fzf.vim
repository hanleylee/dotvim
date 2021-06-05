if !PlugLoaded('fzf.vim')
    finish
endif

command! -nargs=* -complete=file AgAll :call AgAll(<q-args>)
command! -bang FM call fzf#run(fzf#wrap({'source': 'cat ~/.fzf-marks | sed "s/.*: \(.*\)$/\1/" | sed "s#~#${HOME}#"', 'sink': 'e'}, <bang>0))

nnoremap <C-F>       :Files<CR>
nnoremap <C-H>       :History<CR>
nnoremap <C-B>       :Buffers<CR>
nnoremap <C-S>       :SignifyDiff<CR>
nnoremap <Leader>fa  :AgAll<CR>
nnoremap <Leader>fl  :Lines<CR>
nnoremap <Leader>fb  :BCommits<CR>
nnoremap <Leader>fg  :GFiles<CR>
nnoremap <Leader>f?  :GFiles?<CR>
nnoremap <Leader>tg  :Tags<CR>
nnoremap <Leader>fc  :Commits<CR>
nnoremap <Leader>fm  :FM<CR>

" let g:fzf_preview_window = 'right:60%'
let g:fzf_buffers_jump = 1 " [Buffers] Jump to the existing window if possible
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"' " [[B]Commits] Customize the options used by 'git log'
let g:fzf_tags_command = 'ctags -R' " [Tags] Command to generate tags file
let g:fzf_commands_expect = 'alt-enter,ctrl-x' " [Commands] --expect expression for directly executing the command
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-x': 'split',
            \ 'ctrl-v': 'vsplit'
            \}
if has('popupwin') 
    let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.8 } }
else
    let g:fzf_layout = { 'down': '~60%' }
endif

" Search all content use ag
function! AgAll(query, ...)
    let query = empty(a:query) ? '^(?=.)' : a:query
    return fzf#vim#ag_raw('--hidden '.fzf#shellescape(query).' '.getcwd())
endfunction

