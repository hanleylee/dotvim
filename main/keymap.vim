" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

" MARK
" - 如果没有 vim 的默认键位功能, 如 gs, 则可以直接使用 gs 作为按键绑定
" - 如果已经有默认的 vim 功能了, 如 fa, 那么就要添加 leader 或其他前缀键

"███████████████████████   KeyMapping   ██████████████████████████
nnoremap <silent><Backspace>         :noh<CR>
nnoremap <C-g>               :call EchoPath()<CR>
nnoremap <Leader>rp          :call plug#load('')<LEFT><LEFT>
nnoremap gdl                 :diffget LO<CR>
nnoremap gdr                 :diffget RE<CR>
nnoremap gx :silent execute "!open " . shellescape("<cWORD>")<CR>
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%' "%% 自动扩展为当前目录
nnoremap <Leader>ge :set operatorfunc=hl#GrepOperator<cr>g@
vnoremap <Leader>ge :<c-u>call hl#GrepOperator(visualmode())<cr>

" Emac like map in insert mode & command line mode
inoremap <C-e>    <END>
cnoremap <C-e>    <END>
inoremap <C-a>    <HOME>
cnoremap <C-a>    <HOME>
inoremap <C-f>    <RIGHT>
cnoremap <C-f>    <RIGHT>
inoremap <C-b>    <LEFT>
cnoremap <C-b>    <LEFT>

if PlugLoaded('vimspector')
    nmap <Leader>db   <Plug>VimspectorToggleBreakpoint
    nmap <Leader>d_b  <Plug>VimspectorToggleConditionalBreakpoint
    nmap <Leader>dd   :call vimspector#Launch()<CR>
    nmap <Leader>dx   :call vimspector#Reset()<CR>
    nmap <Leader>dX   :call vimspector#ClearBreakpoints()<CR>
    nmap <Leader>dr   <Plug>VimspectorRestart
    nmap <Leader>dc   <Plug>VimspectorContinue
    nmap <Leader>dp   <Plug>VimspectorPause
    nmap <Leader>ds   <Plug>VimspectorStop
    nmap <Leader>di   <Plug>VimspectorBalloonEval
    xmap <Leader>di   <Plug>VimspectorBalloonEval
    nmap <Leader>dj   <Plug>VimspectorStepInto
    nmap <Leader>dk   <Plug>VimspectorStepOut
    nmap <Leader>dl   <Plug>VimspectorStepOver
    nmap <Leader>drc  <Plug>VimspectorRunToCursor
    nmap <Leader>de   :VimspectorEval
    nmap <Leader>dw   :VimspectorWatch
    nmap <Leader>do   :VimspectorShowOutput
endif

if PlugLoaded('vim-autoformat')
    nnoremap <silent><Leader>af  :Autoformat<CR>
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
    nmap <C-x><C-m>      <plug>(fzf-maps-n)
    xmap <C-x><C-m>      <plug>(fzf-maps-x)
    omap <C-x><C-m>      <plug>(fzf-maps-o)
    imap <C-x><C-m>      <plug>(fzf-maps-i)

    nnoremap <Leader>fa  :AgAll<CR>
    nnoremap <Leader>fl  :Lines<CR>
    nnoremap <Leader>fb  :BCommits<CR>
    nnoremap <Leader>fg  :GFiles<CR>
    nnoremap <Leader>f?  :GFiles?<CR>
    nnoremap <Leader>ft  :Tags<CR>
    nnoremap <Leader>fc  :Commits<CR>
    nnoremap <Leader>fm  :FM<CR>
endif

if PlugLoaded('asyncrun.vim')
    nnoremap <F10>       :call asyncrun#quickfix_toggle(6)<CR>
endif

if PlugLoaded('asynctasks.vim')
    " nnoremap <silent><F2> :AsyncTask! file-build-run<CR>
    nnoremap <silent><F2> :call hl#AsyncTask('file-build-run')<CR>
    nnoremap <silent><F3> :call hl#AsyncTask('project-build-run')<CR>
    nnoremap <silent><F4> :call hl#AsyncTask('project-build')<CR>
    nnoremap <silent><F5> :call hl#AsyncTask('project-run')<CR>
endif

if PlugLoaded('coc.nvim')
    " inoremap <silent><expr> <CR>  pumvisible() && !empty(v:completed_item) ? "\<C-y>" : "\<C-g>u\<CR>"
    inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
    inoremap <silent><expr> <C-CR> "\<C-g>u\<CR>"
    " inoremap <silent><expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
    nnoremap <silent>K          :call coc#show_documentation()<CR>

    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    nmap <silent><Leader>rn     <Plug>(coc-rename)
    nmap <silent><Leader>en     <Plug>(coc-diagnostic-next)
    nmap <silent><Leader>ep     <Plug>(coc-diagnostic-prev)
    nmap <silent><Leader>fx     <Plug>(coc-fix-current)
    nmap <silent><Leader>gd     <Plug>(coc-definition)
    nmap <silent><Leader>gy     <Plug>(coc-type-definition)
    nmap <silent><Leader>gi     <Plug>(coc-implementation)
    nmap <silent><Leader>gr     <Plug>(coc-references)

    xmap <Space>f  <Plug>(coc-format-selected)
    nmap <Space>f  <Plug>(coc-format-selected)

    xmap <Space>a  <Plug>(coc-codeaction-selected)
    nmap <Space>a  <Plug>(coc-codeaction-selected)

    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    nmap <Space>ac  <Plug>(coc-codeaction)

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

    " nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    " nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    " inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    " inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    " vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    " vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

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
    vnoremap <Leader>oy :OSCYank<CR>
endif

if PlugLoaded('vim-fugitive')
    nnoremap gs  :Git<CR>
endif

if PlugLoaded('vista')
    nnoremap <F4>                :Vista!!<CR>
endif

if PlugLoaded('YouCompleteMe')
    nnoremap <F1>                :YcmCompleter GoTo<CR>
    nnoremap <silent>K           <Plug>(YCMHover)
    nnoremap <silent><Leader>gr  :YcmCompleter GoToReferences<CR>
    nnoremap <silent><Leader>rn  :YcmCompleter RefactorRename<Space><C-R><C-W>
endif

if PlugLoaded('ale')
    nmap <Leader>en       <Plug>(ale_next)
    nmap <Leader>ep       <Plug>(ale_previous)
endif

