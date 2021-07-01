" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

"███████████████████████   KeyMapping   ██████████████████████████
nnoremap <Backspace>         :noh<CR>
nnoremap <C-g>               :call EchoPath()<CR>
nnoremap <leader>rp          :call plug#load('')<LEFT><LEFT>
nnoremap gdl                 :diffget LO<CR>
nnoremap gdr                 :diffget RE<CR>
nmap gx :silent execute "!open " . shellescape("<cWORD>")<CR>
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%' "%% 自动扩展为当前目录

" Emac like map in insert mode & command line mode
imap <C-E>                   <END>
cmap <C-E>                   <END>
imap <C-A>                   <HOME>
cmap <C-A>                   <HOME>
imap <C-F>                   <RIGHT>
cmap <C-F>                   <RIGHT>
imap <C-B>                   <LEFT>
cmap <C-B>                   <LEFT>

if PlugLoaded('vimspector')
    nmap <leader>db <Plug>VimspectorToggleBreakpoint
    nmap <leader>dcb <Plug>VimspectorToggleConditionalBreakpoint
    nmap <leader>dd :call vimspector#Launch()<CR>
    nmap <leader>dx :call vimspector#Reset()<CR>
    nmap <leader>dX :call vimspector#ClearBreakpoints()<CR>
    nmap <leader>d_ <Plug>VimspectorRestart
    nnoremap <leader>d<space> <Plug>VimspectorContinue
    nmap <leader>dn <Plug>VimspectorContinue
    nmap <leader>dp <Plug>VimspectorPause
    nmap <leader>ds <Plug>VimspectorStop
    nmap <Leader>di <Plug>VimspectorBalloonEval
    xmap <Leader>di <Plug>VimspectorBalloonEval
    nmap <leader>dl <Plug>VimspectorStepInto
    nmap <leader>dj <Plug>VimspectorStepOver
    nmap <leader>dk <Plug>VimspectorStepOut
    nmap <leader>drc <Plug>VimspectorRunToCursor
    nmap <leader>de :VimspectorEval
    nmap <leader>dw :VimspectorWatch
    nmap <leader>do :VimspectorShowOutput
endif

if PlugLoaded('vim-maximizer')
    nnoremap <F12> :MaximizerToggle!<CR>
endif


if PlugLoaded('vim-quickui')
    nnoremap <F1>                :call quickui#tools#preview_tag('')<cr>
    nnoremap <Leader>qm          :call quickui#quick_menu()<cr>
endif

if PlugLoaded('fzf.vim')
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
    nmap <C-x><C-m>      <plug>(fzf-maps-n)
    xmap <C-x><C-m>      <plug>(fzf-maps-x)
    omap <C-x><C-m>      <plug>(fzf-maps-o)
    imap <C-x><C-m>      <plug>(fzf-maps-i)

endif

if PlugLoaded('asyncrun.vim')
    nnoremap <F10>       :call asyncrun#quickfix_toggle(6)<CR>
endif

if PlugLoaded('asynctasks.vim')
    nnoremap <silent><F2> :AsyncTask! file-build-run<CR>
    nnoremap <silent><F3> :AsyncTask! project-build-run<CR>
    nnoremap <silent><F4> :AsyncTask! project-build <CR>
    nnoremap <silent><F5> :AsyncTask! project-run<CR>
endif

if PlugLoaded('coc.nvim')
    nmap <Space>rn      <Plug>(coc-rename)
    nmap <Space>en      <Plug>(coc-diagnostic-next)<CR>
    nmap <Space>ep      <Plug>(coc-diagnostic-prev)<CR>
    nmap <silent>gd     <Plug>(coc-definition)
    nmap <silent>gy     <Plug>(coc-type-definition)
    nmap <silent>gi     <Plug>(coc-implementation)
    nmap <silent>gr     <Plug>(coc-references)
    nnoremap <silent><Leader>D :call coc#show_documentation()<CR>

    xmap <Space>f  <Plug>(coc-format-selected)
    nmap <Space>f  <Plug>(coc-format-selected)

    xmap <Space>a  <Plug>(coc-codeaction-selected)
    nmap <Space>a  <Plug>(coc-codeaction-selected)

    nmap <Space>ac  <Plug>(coc-codeaction)
    nmap <Space>fx  <Plug>(coc-fix-current)

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

    nnoremap <silent><nowait> <Space>cl  :CocList<CR>
    nnoremap <silent><nowait> <Space>cd  :<C-u>CocList diagnostics<cr>
    nnoremap <silent><nowait> <Space>ce  :<C-u>CocList extensions<cr>
    nnoremap <silent><nowait> <Space>cc  :<C-u>CocList commands<cr>
    nnoremap <silent><nowait> <Space>co  :<C-u>CocList outline<cr>
    nnoremap <silent><nowait> <Space>cs  :<C-u>CocList -I symbols<cr>
    nnoremap <silent><nowait> <Space>cy  :<C-u>CocList -A --normal yank<cr>
    nnoremap <silent><nowait> <Space>cr  :<C-u>CocListResume<CR>
    nnoremap <silent><nowait> <Space>cn  :<C-u>CocNext<CR>
    nnoremap <silent><nowait> <Space>cp  :<C-u>CocPrev<CR>

    nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    

    " inoremap <silent><expr> <CR>  pumvisible() && !empty(v:completed_item) ? "\<C-y>" : "\<C-g>u\<CR>"
    inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
    inoremap <silent><expr> <C-CR> "\<C-g>u\<CR>"
    " inoremap <silent><expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
    " inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
    " inoremap <silent><expr> <C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
    " inoremap <silent><expr> <C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

    " inoremap <silent><expr> <TAB>
    "   \ pumvisible() ? "\<C-n>" :
    "   \ <SID>check_back_space() ? "\<TAB>" :
    "   \ coc#refresh()
    " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

endif

if PlugLoaded('vim-easymotion')
    nmap <Leader><Space>          <Plug>(easymotion-bd-w)
    vmap <Leader><Space>          <Plug>(easymotion-bd-w)
endif

if PlugLoaded('vim-oscyank')
    vnoremap <leader>oy :OSCYank<CR>
endif

if PlugLoaded('vim-fugitive')
    nnoremap <Leader>gs  :Git<CR>
endif

if PlugLoaded('vista')
    nnoremap <F4>                :Vista!!<CR>
endif

if PlugLoaded('YouCompleteMe')
    nnoremap <F1>        :YcmCompleter GoTo<CR>
    nmap <Leader>D        <Plug>(YCMHover)
    nnoremap <leader>jr  :YcmCompleter GoToReferences<CR>
    nnoremap <Leader>rn  :YcmCompleter RefactorRename<Space><C-R><C-W>
endif

if PlugLoaded('ale')
    nmap <Leader>en       <Plug>(ale_next)
    nmap <Leader>ep       <Plug>(ale_previous)
endif

