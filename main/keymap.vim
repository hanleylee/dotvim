"███████████████████████   KeyMapping   ██████████████████████████
nnoremap <Backspace>         :noh<CR>
nnoremap <C-g>               :call EchoPath()<CR>
nnoremap <silent><F2>        :Run<CR>
nnoremap gdl                 :diffget LO<CR>
nnoremap gdr                 :diffget RE<CR>
nmap gx :silent execute "!open " . shellescape("<cWORD>")<CR>
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%' "%% 自动扩展为当前目录

if PlugLoaded('vim-oscyank')
    vnoremap <leader>oy :OSCYank<CR>
endif

if PlugLoaded('asyncrun.vim')
    nnoremap <F10>               :call asyncrun#quickfix_toggle(6)<CR>
endif

if PlugLoaded('vim-quickui')
    nnoremap <F3>                :call quickui#tools#preview_tag('')<cr>
    nnoremap <Leader>qm          :call QuickMenu()<cr>
endif

if PlugLoaded('vim-easymotion')
    nmap <Leader><Space>          <Plug>(easymotion-bd-w)
    vmap <Leader><Space>          <Plug>(easymotion-bd-w)
endif

if PlugLoaded('fzf.vim')
    nnoremap <C-F>       :Files<CR>
    nnoremap <C-H>       :History<CR>
    nnoremap <C-B>       :Buffers<CR>
    nnoremap <C-S>       :SignifyDiff<CR>
    nnoremap <Leader>fa  :Ag<CR>
    nnoremap <Leader>fl  :Lines<CR>
    nnoremap <Leader>fb  :BCommits<CR>
    nnoremap <Leader>fg  :GFiles<CR>
    nnoremap <Leader>f?  :GFiles?<CR>
    nnoremap <Leader>tg  :Tags<CR>
    nnoremap <Leader>fc  :Commits<CR>
    nnoremap <Leader>fm  :FM<CR>
endif


if PlugLoaded('vim-autoformat')
    nnoremap <Leader>af  :Autoformat<CR>
endif

if PlugLoaded('vim-fugitive')
    nnoremap <Leader>gs  :Git<CR>
endif

if PlugLoaded('vista.vim')
    nnoremap <F4>                :Vista!!<CR>
endif

if PlugLoaded('coc.nvim')
    nmap <Leader>en       <Plug>(coc-diagnostic-next)<CR>
    nmap <Leader>ep       <Plug>(coc-diagnostic-prev)<CR>
    nmap <silent> gd      <Plug>(coc-definition)
    nmap <silent> gy      <Plug>(coc-type-definition)
    nmap <silent> gi      <Plug>(coc-implementation)
    nmap <silent> gr      <Plug>(coc-references)
    nmap <leader>rn       <Plug>(coc-rename)
    nnoremap <silent><Leader>D :call <SID>show_documentation()<CR>

    function! s:show_documentation()
        if (index(['vim','help'], &filetype) >= 0)
            execute 'h '.expand('<cword>')
        elseif (coc#rpc#ready())
            call CocActionAsync('doHover')
        else
            execute '!' . &keywordprg . " " . expand('<cword>')
        endif
    endfunction

    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    nmap <leader>ac  <Plug>(coc-codeaction)
    nmap <leader>qf  <Plug>(coc-fix-current)

    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    nnoremap <silent><nowait> <Space>cd  :<C-u>CocList diagnostics<cr>
    nnoremap <silent><nowait> <Space>ce  :<C-u>CocList extensions<cr>
    nnoremap <silent><nowait> <Space>cc  :<C-u>CocList commands<cr>
    nnoremap <silent><nowait> <Space>co  :<C-u>CocList outline<cr>
    nnoremap <silent><nowait> <Space>cs  :<C-u>CocList -I symbols<cr>
    nnoremap <silent><nowait> <Space>cn  :<C-u>CocNext<CR>
    nnoremap <silent><nowait> <Space>cp  :<C-u>CocPrev<CR>
    nnoremap <silent><nowait> <Space>cr  :<C-u>CocListResume<CR>
    nnoremap <silent><nowait> <Space>cy  :<C-u>CocList -A --normal yank<cr>
endif

" nnoremap [s                            i<space><esc>l
" nnoremap ]s                            a<space><esc>h
" nnoremap <F1>        :YcmCompleter GoTo<CR>
" nmap <Leader>D        <Plug>(YCMHover)
" nnoremap <leader>jr  :YcmCompleter GoToReferences<CR>
" nnoremap <Leader>rn  :YcmCompleter RefactorRename<Space><C-R><C-W>
" nmap <Leader>en       <Plug>(ale_next)
" nmap <Leader>ep       <Plug>(ale_previous)
