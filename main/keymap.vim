" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" MARK
" - 如果没有 vim 的默认键位功能, 如 gs, 则可以直接使用 gs 作为按键绑定
" - 如果已经有默认的 vim 功能了, 如 fa, 那么就要
" - 添加 leader "   - 添加与该插件命名有关的组合前缀键, 如 <C-c> 是 coc

"=======================   Terminal Keycode   ============================
call Source('$VIM_CONFIG/main/term_keycode.vim')

"=======================   GUI Keycode   ============================
call Source('$VIM_CONFIG/main/gui_keymap.vim')"

"███████████████████████   KeyMapping   ██████████████████████████
" Main map {{{
" let g:mapleader="\<Space>"

" nnoremap <silent>-           :Explore<CR>
nnoremap <silent><C-q>       :x<CR>
nnoremap <silent><C-w>q      :call hl#CloseAll()<CR>
nnoremap <silent><Backspace> :noh<CR>
nnoremap <C-g>               :call EchoPath()<CR>
" inoremap <M-;> <C-o>m`<C-o>A;<C-o>``
" nnoremap <M-;> m`A;<Esc>``
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%' "%% 自动扩展为当前目录
nnoremap ge :set operatorfunc=hl#GrepOperator<cr>g@
vnoremap ge :<c-u>call hl#GrepOperator(visualmode())<cr>
nnoremap <silent><S-F2> :call hl#SyncTask()<CR>
" 确保没有注释跟随, 且不选中补全
" inoremap <silent><expr> <C-CR> "\<C-g>u\<CR>\<C-u>"
inoremap <silent> <C-CR> <C-g>u<CR>
nnoremap <silent><expr> <C-CR> "o\<C-u>"
" nnoremap <Leader>rp          :call plug#load('')<LEFT><LEFT>
" nnoremap gx :silent execute "!open " . shellescape("<cWORD>")<CR>

" keeping it center
" nnoremap n nzzzv
" nnoremap N Nzzzv
" nnoremap <silent> J :call hl#merge_line()<CR>
nnoremap Y y$

" jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" nnoremap <silent> \d :<C-U>bprevious <bar> bdelete #<CR>
" nnoremap <expr> oo printf('m`%so<ESC>``', v:count1)
" nnoremap <expr> OO printf('m`%sO<ESC>``', v:count1)

" add fold include top and bottom extra 1 line
vmap ZF :<C-u>execute "normal! '<O\<lt>ESC>'>o\<lt>ESC>V'<kzf"<CR>

" moving text(use unimpaired instead this)
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv
" inoremap <C-j> <esc>:m .+1<CR>==
" inoremap <C-k> <esc>:m .-2<CR>==
" nnoremap <leader>k :m .-2<CR>==
" nnoremap <leader>j :m .+1<CR>==

" Emac like map in insert mode & command line mode
inoremap <C-e>    <End>
cnoremap <C-e>    <End>
inoremap <C-a>    <Home>
cnoremap <C-a>    <Home>
inoremap <C-f>    <Right>
cnoremap <C-f>    <Right>
inoremap <C-b>    <Left>
cnoremap <C-b>    <Left>
"}}}

noremap <silent><tab>m :tabnew<cr>
noremap <silent><tab>e :tabclose<cr>
noremap <silent><tab>n :tabn<cr>
noremap <silent><tab>p :tabp<cr>

if PlugLoaded('fern.vim')
    nnoremap <silent> <F1> :Fern . -drawer -reveal=% -toggle -width=50<cr>
    nnoremap <silent> -    :Fern . -reveal=%<cr>
endif

" vim-surround {{{
if PlugLoaded('vim-surround')
    nmap do) ds)db
    nmap do] ds]db
endif
" }}}

" nerdtree {{{
if PlugLoaded('nerdtree')
    nnoremap <F1> :call hl#nerdtree#toggle_vcs_focus_current()<cr>
    nnoremap <leader>nt :NERDTreeToggleVCS<CR>
    nnoremap <leader>nf :NERDTreeFind<CR>

    " nnoremap <S-F1> :NERDTreeVCS <bar> wincmd p <bar>  NERDTreeFind <cr>
endif
"}}}

" vimspector {{{
if PlugLoaded('vimspector')
    nmap <Leader>d.   <Plug>VimspectorToggleBreakpoint
    nmap <Leader>d_.  <Plug>VimspectorToggleConditionalBreakpoint
    " nmap <Leader>dd   :call vimspector#Launch()<CR>
    nmap <Leader>dd   <Plug>VimspectorContinue
    nmap <Leader>dc   <Plug>VimspectorContinue
    nmap <Leader>dx   :call vimspector#Reset()<CR>
    nmap <Leader>dX   :call vimspector#ClearBreakpoints()<CR>
    nmap <Leader>dr   <Plug>VimspectorRestart
    nmap <Leader>dp   <Plug>VimspectorPause
    nmap <Leader>ds   <Plug>VimspectorStop
    nmap <Leader>di   <Plug>VimspectorBalloonEval
    xmap <Leader>di   <Plug>VimspectorBalloonEval
    nmap <Leader>dj   <Plug>VimspectorStepInto
    nmap <Leader>dk   <Plug>VimspectorStepOut
    nmap <Leader>dl   <Plug>VimspectorStepOver
    nmap <Leader>drc  <Plug>VimspectorRunToCursor
    nmap <Leader>de   :VimspectorEval<Space>
    nmap <Leader>dw   :VimspectorWatch<Space>
    nmap <Leader>do   :VimspectorShowOutput<Space>
endif
"}}}

" vim-unimpaired {{{
if PlugLoaded('vim-unimpaired')
    nmap <silent> []<Space> :execute "normal [\<Space>]\<Space>"<CR>
    vmap <silent> []<Space> :<C-u>execute "normal '<[\<Space>'>]\<Space>"<CR>
endif
"}}}

" FastFold {{{
if PlugLoaded('FastFold')
    nmap zuz <Plug>(FastFoldUpdate)
endif
"}}}

" open-browser {{{
if PlugLoaded('open-browser.vim')
    let g:netrw_nogx = 1 " disable gx keymap
    nmap gx <Plug>(openbrowser-smart-search)
    vmap gx <Plug>(openbrowser-smart-search)
endif
"}}}

" vim-autoformat {{{
if PlugLoaded('vim-autoformat')
    nnoremap <silent><Leader>af  :call hl#format_document()<CR>
endif
"}}}

" vim-maximzer {{{
if PlugLoaded('vim-maximizer')
    nnoremap <F12> :MaximizerToggle!<CR>
endif
"}}}

" vim-floaterm {{{
if PlugLoaded('vim-floaterm')
    nnoremap <silent><F3>          :FloatermToggle<CR>
    tnoremap <silent><F3>          <C-\><C-n>:FloatermToggle<CR>
    nnoremap <silent><Leader>tw    :FloatermNew<CR>
    tnoremap <silent><Leader>tw    <C-\><C-n>:FloatermNew<CR>
    nnoremap <silent><Leader>tp    :FloatermPrev<CR>
    tnoremap <silent><Leader>tp    <C-\><C-n>:FloatermPrev<CR>
    nnoremap <silent><Leader>tn    :FloatermNext<CR>
    tnoremap <silent><Leader>tn    <C-\><C-n>:FloatermNext<CR>
    nnoremap <silent><Leader>ts    :FloatermFirst<CR>
    tnoremap <silent><Leader>ts    <C-\><C-n>:FloatermFirst<CR>
    nnoremap <silent><Leader>te    :FloatermLast<CR>
    tnoremap <silent><Leader>te    <C-\><C-n>:FloatermLast<CR>
    nnoremap <silent><Leader>tk    :FloatermKill<CR>
    tnoremap <silent><Leader>tk    <C-\><C-n>:FloatermKill<CR>
    nnoremap <silent><Leader>tcd   :FloatermSend cd %:p:h<CR>

    nnoremap <silent><Leader>lf    :FloatermNew lf<CR>
endif
"}}}

" vim-quickui {{{
if PlugLoaded('vim-quickui')
    " nnoremap <silent><F1>                :call quickui#tools#preview_tag('')<cr>
    nnoremap <silent><Leader>qm          :call hl#quickui#quick_menu()<cr>
    nnoremap <silent><Leader>qd          :call hl#quickui#show_dict(expand("<cword>"))<cr>
    vnoremap <silent><Leader>qd          :<C-u>call hl#quickui#show_dict(hl#visual_selection())<cr>
    nnoremap <silent><Leader>qt          :call hl#quickui#show_translate(expand("<cword>"))<cr>
    vnoremap <silent><Leader>qt          :<C-u>call hl#quickui#show_translate(hl#visual_selection())<cr>
endif
"}}}

" vim-renamer {{{
if PlugLoaded('vim-renamer')
    " nmap <Leader>rr <Plug>RenamerStart
    nmap <Leader>rr :Renamer %:p:h<cr>
    nmap <Leader>rc :Ren<CR>
endif
"}}}

" wilder.nvim {{{
if PlugLoaded('wilder.nvim')
    cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
    cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"
endif
"}}}

" fzf.vim {{{
if PlugLoaded('fzf.vim')
    nnoremap <silent><C-F>       :Files<CR>
    nnoremap <silent><C-H>       :History<CR>
    nnoremap <silent><C-B>       :Buffers<CR>
    nmap <C-x><C-m>      <Plug>(fzf-maps-n)
    xmap <C-x><C-m>      <Plug>(fzf-maps-x)
    omap <C-x><C-m>      <Plug>(fzf-maps-o)
    imap <C-x><C-m>      <Plug>(fzf-maps-i)

    nnoremap <Leader>fa  :AgAll<CR>
    nnoremap <Leader>fl  :Lines<CR>
    nnoremap <Leader>fb  :BCommits<CR>
    nnoremap <Leader>fg  :GFiles<CR>
    nnoremap <Leader>f?  :GFiles?<CR>
    nnoremap <Leader>ft  :Tags<CR>
    nnoremap <Leader>fc  :Commits<CR>
    nnoremap <M-m>       :FM<CR>
endif
"}}}

" asyncrun.vim {{{
if PlugLoaded('asyncrun.vim')
    nnoremap <F10>       :call asyncrun#quickfix_toggle(10)<CR>
endif
"}}}

" vim-qf {{{
if PlugLoaded('vim-qf')
    " nmap <F10> <Plug>(qf_qf_toggle)
endif
"}}}

" ctrlsf.vim{{{
if PlugLoaded('ctrlsf.vim')
    nmap     <C-s>f <Plug>CtrlSFPrompt
    vmap     <C-s>f <Plug>CtrlSFVwordPath<CR>
    vmap     <C-s>F <Plug>CtrlSFVwordExec
    nmap     <C-s>n <Plug>CtrlSFCwordPath
    nmap     <C-s>p <Plug>CtrlSFPwordPath
    nnoremap <C-s>o :CtrlSFOpen<CR>
    nnoremap <C-s>t :CtrlSFToggle<CR>
    inoremap <C-s>t <Esc>:CtrlSFToggle<CR>
endif
"}}}

" asynctasks.vim {{{
if PlugLoaded('asynctasks.vim')
    " nnoremap <silent><F2> :AsyncTask! file-build-run<CR>
    nnoremap <silent><F2> :call hl#AsyncTask('file-build-run')<CR>
    nnoremap <silent><F6> :call hl#AsyncTask('project-build-run')<CR>
    nnoremap <silent><F7> :call hl#AsyncTask('project-build')<CR>
    nnoremap <silent><F8> :call hl#AsyncTask('project-run')<CR>
    nnoremap <silent><M-.> :AsyncStop<CR>
endif
"}}}

if PlugLoaded('vim-sandwich')
    xmap is <Plug>(textobj-sandwich-query-i)
    xmap as <Plug>(textobj-sandwich-query-a)
    omap is <Plug>(textobj-sandwich-query-i)
    omap as <Plug>(textobj-sandwich-query-a)

    xmap iss <Plug>(textobj-sandwich-auto-i)
    xmap ass <Plug>(textobj-sandwich-auto-a)
    omap iss <Plug>(textobj-sandwich-auto-i)
    omap ass <Plug>(textobj-sandwich-auto-a)

    xmap im <Plug>(textobj-sandwich-literal-query-i)
    xmap am <Plug>(textobj-sandwich-literal-query-a)
    omap im <Plug>(textobj-sandwich-literal-query-i)
    omap am <Plug>(textobj-sandwich-literal-query-a)
endif

vnoremap <silent> <C-T> :<C-u>Ydv<CR>
nnoremap <silent> <C-T> :<C-u>Ydc<CR>
noremap <leader>yd :<C-u>Yde<CR>
" coc.vim {{{
if PlugLoaded('coc.nvim')
    " inoremap <silent><expr> <CR>  pumvisible() && !empty(v:completed_item) ? "\<C-y>" : "\<C-g>u\<CR>"
    " inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
    inoremap <silent><expr> <CR> hl#coc#insert_map_for_enter()
    " inoremap <silent><expr> <CR> "\<C-y>"
    " inoremap <silent><expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
    nnoremap <silent>K          :call hl#coc#show_documentation()<CR>
    nmap <silent>gd             <Plug>(coc-definition)
    nmap <silent>gy             <Plug>(coc-type-definition)
    nmap <silent>gm             <Plug>(coc-implementation)
    nmap <silent>gr             <Plug>(coc-references)


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
    xmap <C-c>f  <Plug>(coc-format-selected)
    nmap <C-c>f  <Plug>(coc-format-selected)

    xmap <C-c>a  <Plug>(coc-codeaction-selected)
    nmap <C-c>a  <Plug>(coc-codeaction-selected)

    nmap <silent> <C-c>r <Plug>(coc-range-select)
    xmap <silent> <C-c>r <Plug>(coc-range-select)

    nmap <C-c>ac  <Plug>(coc-codeaction)

    nnoremap <silent><nowait> <C-c>cl  :CocList<CR>
    nnoremap <silent><nowait> <C-c>cd  :<C-u>CocList diagnostics<cr>
    nnoremap <silent><nowait> <C-c>ce  :<C-u>CocList extensions<cr>
    nnoremap <silent><nowait> <C-c>cc  :<C-u>CocList commands<cr>
    nnoremap <silent><nowait> <C-c>co  :<C-u>CocList outline<cr>
    nnoremap <silent><nowait> <C-c>cs  :<C-u>CocList -I symbols<cr>
    nnoremap <silent><nowait> <C-c>cy  :<C-u>CocList -A --normal yank<cr>
    nnoremap <silent><nowait> <C-c>cr  :<C-u>CocListResume<CR>
    nnoremap <silent><nowait> <C-c>cn  :<C-u>CocNext<CR>
    nnoremap <silent><nowait> <C-c>cp  :<C-u>CocPrev<CR>

    " inoremap <silent><nowait><expr> <M-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    " inoremap <silent><nowait><expr> <M-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    " vnoremap <silent><nowait><expr> <M-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    " vnoremap <silent><nowait><expr> <M-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

    " inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
    " inoremap <silent><expr> <C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
    " inoremap <silent><expr> <C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

    " inoremap <silent><expr> <TAB>
    "   \ pumvisible() ? "\<C-n>" :
    "   \ <SID>check_back_space() ? "\<TAB>" :
    "   \ coc#refresh()
    " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

endif
"}}}

" vim-dadbod{{{
if PlugLoaded('vim-dadbod')
    xnoremap <expr> <Plug>(DBExe)     db#op_exec()
    nnoremap <expr> <Plug>(DBExe)     db#op_exec()
    nnoremap <expr> <Plug>(DBExeLine) db#op_exec() . '_'

    xmap <leader>sq  <Plug>(DBExe)
    nmap <leader>sq  <Plug>(DBExe)
    omap <leader>sq  <Plug>(DBExe)
    nmap <leader>sql <Plug>(DBExeLine)
endif
"}}}


if PlugLoaded('vim-dadbod-ui')
    nnoremap <silent> <leader>qt :DBUIToggle<CR>
    nnoremap <silent> <leader>qf :DBUIFindBuffer<CR>
    nnoremap <silent> <leader>qr :DBUIRenameBuffer<CR>
    nnoremap <silent> <leader>ql :DBUILastQueryInfo<CR>
endif


" vim-gitgutter {{{
if PlugLoaded('vim-gitgutter')
    nmap [h         <Plug>(GitGutterPrevHunk)
    nmap ]h         <Plug>(GitGutterNextHunk)

    omap ih         <Plug>(GitGutterTextObjectInnerPending)
    omap ah         <Plug>(GitGutterTextObjectOuterPending)
    xmap ih         <Plug>(GitGutterTextObjectInnerVisual)
    xmap ah         <Plug>(GitGutterTextObjectOuterVisual)

    nmap <Leader>hp <Plug>(GitGutterPreviewHunk)
    nmap <Leader>hs <Plug>(GitGutterStageHunk)
    nmap <Leader>hu <Plug>(GitGutterUndoHunk)
endif
"}}}

" vim-easymotion {{{
if PlugLoaded('vim-easymotion')
    nmap <Space>          <Plug>(easymotion-bd-w)
    vmap <Space>          <Plug>(easymotion-bd-w)
    " Move to line
    map <Leader>L <Plug>(easymotion-bd-jk)
    nmap <Leader>L <Plug>(easymotion-overwin-line)
endif
"}}}

" vim-oscyank {{{
if PlugLoaded('vim-oscyank')
    vnoremap <Leader>oy :OSCYank<CR>
endif
"}}}

" vim-fugitive {{{
if PlugLoaded('vim-fugitive')
    nnoremap <silent>gs  :Git<CR>
endif
"}}}

" vista {{{
if PlugLoaded('vista')
    nnoremap <F4>                :Vista!!<CR>
endif
"}}}

" inline_edit.vim {{{
if PlugLoaded('inline_edit.vim')
    nnoremap <leader>ie :InlineEdit<cr>
    xnoremap <leader>ie :InlineEdit<cr>
endif
"}}}

" YouCompleteMe {{{
if PlugLoaded('YouCompleteMe')
    nnoremap gd                  :YcmCompleter GoTo<CR>
    nnoremap <silent>K           <Plug>(YCMHover)
    nnoremap <silent><Leader>gr  :YcmCompleter GoToReferences<CR>
    nnoremap <silent><Leader>rn  :YcmCompleter RefactorRename<Space><C-R><C-W>
endif
"}}}

" ale {{{
if PlugLoaded('ale')
    nmap <Leader>en       <Plug>(ale_next)
    nmap <Leader>ep       <Plug>(ale_previous)
endif
"}}}

