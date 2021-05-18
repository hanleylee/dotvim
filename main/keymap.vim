"███████████████████████   KeyMapping   ██████████████████████████
nnoremap <Backspace> :noh<CR>
nnoremap <C-g>       :call EchoPath()<CR>
" go to its definition, then declaration if definition is not accessible
nnoremap <F1>        :YcmCompleter GoTo<CR>
nnoremap <silent><F2>        :Run<CR>
nnoremap <F3>        :call quickui#tools#preview_tag('')<cr>
nnoremap <F4>        :Vista!!<CR>
nnoremap <F10>       :call asyncrun#quickfix_toggle(6)<CR>
nmap <Space>          <Plug>(easymotion-bd-w)
vmap <Space>          <Plug>(easymotion-bd-w)
nmap <Leader>en       <Plug>(ale_next)
nmap <Leader>ep       <Plug>(ale_previous)
nmap <Leader>D        <Plug>(YCMHover)
nnoremap <C-F>       :Files<CR>
nnoremap <C-H>       :History<CR>
nnoremap <C-B>       :Buffers<CR>
nnoremap <C-S>       :SignifyDiff<CR>
" go to reference
nnoremap <leader>jr  :YcmCompleter GoToReferences<CR>
" rename func or param
noremap <Leader><space> :call QuickMenu()<cr>
nnoremap <Leader>rn  :YcmCompleter RefactorRename<Space><C-R><C-W>
nnoremap <Leader>fa  :Ag<CR>
nnoremap <Leader>fl  :Lines<CR>
nnoremap <Leader>fb  :BCommits<CR>
nnoremap <Leader>fg  :GFiles<CR>
nnoremap <Leader>f?  :GFiles?<CR>
nnoremap <Leader>tg  :Tags<CR>
nnoremap <Leader>fc  :Commits<CR>
nnoremap <Leader>fm  :FM<CR>
nnoremap <Leader>sn  :UltiSnipsEdit<CR>
nnoremap <Leader>af  :Autoformat<CR>
nnoremap <Leader>gs  :Git<CR>

" nnoremap [s                            i<space><esc>l
" nnoremap ]s                            a<space><esc>h
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%' "%% 自动扩展为当前目录
