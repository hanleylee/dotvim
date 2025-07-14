" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" MARK
" - 如果没有 vim 的默认键位功能, 如 gs, 则可以直接使用 gs 作为按键绑定
" - 如果已经有默认的 vim 功能了, 如 fa, 那么就要
"    - 添加 leader "
"    - 添加与该插件命名有关的组合前缀键, 如 <C-c> 是 coc

"███████████████████████   KeyMapping   ██████████████████████████
" Main map {{{
" let g:mapleader="\<Space>"

nmap <F5> :e!<CR>

" nnoremap <silent>-           :Explore<CR>
nnoremap <silent><C-q>       :x<CR>
nnoremap <silent><Backspace> :noh<CR>
nnoremap <C-g>               :call hl#util#EchoPath()<CR>
" Ctrl-S 保存文件
nnoremap <silent><C-s>       :update<CR>
inoremap <silent><C-s>       <ESC>:update<CR>
vnoremap <silent><C-s>       <ESC>:update<CR>

inoremap <silent> <C-j> <End><CR>
"%% 自动扩展为当前目录
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%'
nnoremap ge :set operatorfunc=hl#grep_operator<cr>g@
vnoremap ge :<c-u>call hl#grep_operator(visualmode())<cr>
nnoremap cd :lcd %:p:h<CR>:echo expand('%:p:h')<CR>
nnoremap <silent><S-F2> :call hl#sync_task()<CR>
" insert newline, *with* comment prefix
inoremap <silent><expr> <C-CR> hl#operate#insert_new_line(0)
" insert newline, *without* comment prefix
inoremap <silent><expr> <C-M-CR> hl#operate#insert_new_line(1)
" insert newline but keep cursor still
inoremap <silent><expr> <M-CR> "\<Esc>O"

" nnoremap <Leader>rp          :call plug#load('')<LEFT><LEFT>
" nnoremap gx :silent execute "!open " . shellescape("<cWORD>")<CR>

" keeping it center
" nnoremap n nzzzv
" nnoremap N Nzzzv
nnoremap Y y$

" jumplist mutations
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

if has('patch-9.1.0375')
    packadd! comment
    nnoremap <silent> <expr> gc comment.Toggle()
    xnoremap <silent> <expr> gc comment.Toggle()
    nnoremap <silent> <expr> gcc comment.Toggle() .. '_'
endif


if hl#plug_loaded('vim-blockmove')
    " 上下移动文字
    " vnoremap <C-j> :m '>+1<CR>gv=gv
    " vnoremap <C-k> :m '<-2<CR>gv=gv
    nmap <C-k> <Plug>MoveLineUp
    vmap <C-k> <Plug>MoveLineUp
    nmap <C-j> <Plug>MoveLineDown
    vmap <C-j> <Plug>MoveLineDown
    vmap <silent><A-k> <Plug>MoveBlockUp
    vmap <silent><A-j> <Plug>MoveBlockDown
    vmap <silent><A-h> <Plug>MoveBlockLeft
    vmap <silent><A-l> <Plug>MoveBlockRight
endif

" nnoremap / /\v
" nnoremap <silent> \d :<C-U>bprevious <bar> bdelete #<CR>
" nnoremap <expr> oo printf('m`%so<ESC>``', v:count1)
" nnoremap <expr> OO printf('m`%sO<ESC>``', v:count1)

nnoremap <C-BS> :echom 123<cr>
nnoremap <Space> za
vnoremap <Space> zf
" add fold include top and bottom extra 1 line
vmap ZF :<C-u>execute "normal! '<O\<lt>ESC>'>o\<lt>ESC>V'<kzf"<CR>

nnoremap <leader>ms :ChezmoiSwap<cr>
nnoremap <leader>ma :ChezmoiApply<cr>

" noremap <silent> <Plug>(MergeLine)   :call hl#operate#merge_line()<Bar>silent! call repeat#set("\<lt>Plug>(MergeLine)")<CR>
" nnoremap <silent> J <Plug>(MergeLine)

noremap <silent> <Plug>(RevertMergeLine)   :call hl#operate#revert_merge_line()<Bar>silent! call repeat#set("\<lt>Plug>(RevertMergeLine)")<CR>
nnoremap <silent> <leader>J <Plug>(RevertMergeLine)

nnoremap <Leader>bp :call hl#operate#block_paste('tail')<CR>
nnoremap <Leader>bP :call hl#operate#block_paste('head')<CR>
nnoremap <Leader>W :w !sudo tee % > /dev/null<CR>

nnoremap <silent><Leader>af :GeneralFormat<CR>
vnoremap <silent><Leader>af :GeneralFormat<CR>

" moving text(use unimpaired instead this)
" vnoremap J :m '>+1<CR>gv=gv
" vnoremap K :m '<-2<CR>gv=gv
" inoremap <C-j> <esc>:m .+1<CR>==
" inoremap <C-k> <esc>:m .-2<CR>==
" nnoremap <leader>k :m .-2<CR>==
" nnoremap <leader>j :m .+1<CR>==

" quick switch between tab
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<CR>

" Emacs like map in insert mode & command line mode
inoremap <C-e>    <End>
cnoremap <C-e>    <End>
inoremap <C-a>    <Home>
cnoremap <C-a>    <Home>
inoremap <C-f>    <Right>
cnoremap <C-f>    <Right>
inoremap <C-b>    <Left>
cnoremap <C-b>    <Left>
inoremap <C-p>    <Up>
cnoremap <C-p>    <Up>
inoremap <C-n>    <Down>
cnoremap <C-n>    <Down>
"}}}

" replace vim's built-in visual * and # behavior {{{
xnoremap * :<C-u>call hl#util#VisualStarSearchSet('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call hl#util#VisualStarSearchSet('?')<CR>?<C-R>=@/<CR><CR>

nnoremap <leader>* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'<CR>
vnoremap <leader>* :<C-u>call hl#util#VisualStarSearchSet('/')<CR>:execute 'noautocmd vimgrep /' . @/ . '/ **'<CR>
" }}}

" replace vim's built-in search and replace behavior {{{
" nnoremap / /\v
" cnoremap s/ s/\v
" }}}

nnoremap <silent> <Leader>hl :call matchadd('LineHighlight', '\%' . line('.') . 'l')<CR>
nnoremap <silent> <Leader>hc :call clearmatches()<CR>

let g:netrw_nogx = 1 " disable gx keymap
nmap <silent>gx :silent call hl#external#OpenInBrowser('n')<cr>
xmap <silent>gx :<C-u>silent call hl#external#OpenInBrowser('v')<cr>

" nnoremap <silent> gx :call hl#external#OpenInBrowser2()<CR>

vnoremap ;rv c<C-O>:set revins<CR><C-R>"<Esc>:set norevins<CR>

" vnoremap ik 0o$h
" onoremap ik :normal vik<cr>
" vnoremap ak 0o$
" onoremap ak :normal vak<cr>

nnoremap <leader>ctt :CopyToTempTab<CR>

if hl#plug_loaded('fern.vim')
    nnoremap <silent> <F1> :Fern . -drawer -reveal=% -toggle -width=50<cr>
    nnoremap <silent> -    :Fern . -reveal=% -wait<cr>
endif

" vim-surround {{{
if hl#plug_loaded('vim-surround')
    nmap do) ds)db
    nmap do] ds]db
endif
" }}}

if hl#plug_loaded('vim-cycle')
    silent! nmap <silent> <unique> <Leader><C-a> <Plug>CycleNext
    silent! vmap <silent> <unique> <Leader><C-a> <Plug>CycleNext
endif

" nerdtree {{{
if hl#plug_loaded('nerdtree')
    nnoremap <F1> :call hl#nerdtree#toggle_vcs_focus_current()<cr>
    nnoremap <leader>nt :NERDTreeToggleVCS<CR>
    nnoremap <leader>nf :NERDTreeFind<CR>

    " nnoremap <S-F1> :NERDTreeVCS <bar> wincmd p <bar>  NERDTreeFind <cr>
endif
"}}}

" vimspector {{{
if hl#plug_loaded('vimspector')
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
if hl#plug_loaded('vim-unimpaired')
    nmap <silent> []<Space> :execute "normal [\<Space>]\<Space>"<CR>
    vmap <silent> []<Space> :<C-u>execute "normal '<[\<Space>'>]\<Space>"<CR>
endif
"}}}

" FastFold {{{
if hl#plug_loaded('FastFold')
    nmap zuz <Plug>(FastFoldUpdate)
    command! -nargs=0 FDM :echo w:lastfdm
endif
"}}}

" vim-maximzer {{{
if hl#plug_loaded('vim-maximizer')
    nnoremap <F12> :MaximizerToggle!<CR>
endif
"}}}

" vim-floaterm {{{
if hl#plug_loaded('vim-floaterm')
    nnoremap <silent><F3>          :FloatermToggle<CR>
    tnoremap <silent><F3>          <C-\><C-n>:FloatermToggle<CR>
    nnoremap <silent><Leader>tn    :FloatermNext<CR>
    tnoremap <silent><Leader>tn    <C-\><C-n>:FloatermNext<CR>
    nnoremap <silent><Leader>tk    :FloatermKill<CR>
    tnoremap <silent><Leader>tk    <C-\><C-n>:FloatermKill<CR>
    nnoremap <silent><Leader>tcd   :FloatermSend cd %:p:h<CR>
    " nnoremap <silent><Leader>tw    :FloatermNew<CR>
    " tnoremap <silent><Leader>tw    <C-\><C-n>:FloatermNew<CR>
    " nnoremap <silent><Leader>tp    :FloatermPrev<CR>
    " tnoremap <silent><Leader>tp    <C-\><C-n>:FloatermPrev<CR>
    " nnoremap <silent><Leader>ts    :FloatermFirst<CR>
    " tnoremap <silent><Leader>ts    <C-\><C-n>:FloatermFirst<CR>
    " nnoremap <silent><Leader>te    :FloatermLast<CR>
    " tnoremap <silent><Leader>te    <C-\><C-n>:FloatermLast<CR>

    nnoremap <silent><Leader>lf    :FloatermNew hl_yazi<CR>
    nnoremap <silent><C-l>         :FloatermNew hl_yazi<CR>
    nnoremap <silent><Leader>lg    :FloatermNew lazygit<CR>

endif
"}}}

" vim-quickui {{{
if hl#plug_loaded('vim-quickui')
    nnoremap <silent><Leader>pf          :call hl#quickui#preview_dir_file(expand('<cfile>'))<cr>
    nnoremap <silent><Leader>qm          :call hl#quickui#quick_menu()<cr>
    nnoremap <silent><Leader>qd          :call hl#quickui#show_dict(expand("<cword>"))<cr>
    nnoremap <silent><Leader>pt          :call quickui#tools#preview_tag('')<cr>
    vnoremap <silent><Leader>qd          :<C-u>call hl#quickui#show_dict(hl#text#visual_selection(visualmode()))<cr>
    " nnoremap <silent><Leader>qt          :call hl#quickui#show_translate(expand("<cword>"))<cr>
    " vnoremap <silent><Leader>qt          :<C-u>call hl#quickui#show_translate(hl#text#visual_selection(visualmode()))<cr>
    nnoremap <silent><Leader>K           :call hl#quickui#show_context(expand("<cword>"))<CR>
    vnoremap <silent><Leader>K           :<C-u>call hl#quickui#show_context(hl#text#visual_selection(visualmode()))<CR>
endif
"}}}

" vim-renamer {{{
if hl#plug_loaded('vim-renamer')
    " nmap <Leader>rr <Plug>RenamerStart
    nmap <Leader>rr :Renamer %:p:h<cr>
    nmap <Leader>rc :Ren<CR>
endif
"}}}

" vim-test {{{ "
if hl#plug_loaded('vim-test')
    nmap <silent> <leader>tn :TestNearest<CR>
    nmap <silent> <leader>tf :TestFile<CR>
    nmap <silent> <leader>ts :TestSuite<CR>
    nmap <silent> <leader>tl :TestLast<CR>
    nmap <silent> <leader>tv :TestVisit<CR>
endif
" }}} vim-test "

" wilder.nvim {{{
if hl#plug_loaded('wilder.nvim')
    cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
    cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"
endif
"}}}

" fzf.vim {{{
if hl#plug_loaded('fzf.vim')
    nnoremap <silent><C-F>       :Files<CR>
    nnoremap <silent><C-H>       :History<CR>
    nnoremap <silent><C-B>       :Buffers<CR>
    nmap <C-x><C-m>      <Plug>(fzf-maps-n)
    xmap <C-x><C-m>      <Plug>(fzf-maps-x)
    omap <C-x><C-m>      <Plug>(fzf-maps-o)
    imap <C-x><C-m>      <Plug>(fzf-maps-i)
    " Insert mode completion
    " imap <c-x><c-k> <plug>(fzf-complete-word)
    " inoremap <expr> <c-x><c-k> fzf#vim#complete('cat /usr/share/dict/words')
    inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
    " imap <c-x><c-f> <plug>(fzf-complete-path)
    inoremap <expr> <c-x><c-f> fzf#vim#complete#path('fd')
    imap <c-x><c-l> <plug>(fzf-complete-line)

    " without hidden files and ignored files
    nnoremap <Leader>fa :Ag<CR>
    " with hidden files(such as dot files)
    nnoremap <Leader>fAH :AgWithHidden<CR>
    " with all files(include ignored files and hidden files)
    nnoremap <Leader>fAA :AgAll<CR>

    nnoremap <Leader>fr :Rg<CR>

    nnoremap <Leader>fh  :History:<CR>
    nnoremap <Leader>fl  :Lines<CR>
    nnoremap <Leader>fb  :BCommits<CR>
    nnoremap <Leader>fg  :GFiles<CR>
    nnoremap <Leader>f?  :GFiles?<CR>
    nnoremap <Leader>ft  :Tags<CR>
    nnoremap <Leader>fc  :Commits<CR>
endif
"}}}

" asyncrun.vim {{{
if hl#plug_loaded('asyncrun.vim')
    nnoremap <F10>       :call asyncrun#quickfix_toggle(10)<CR>
endif
"}}}

" asynctasks.vim {{{
if hl#plug_loaded('asynctasks.vim')
    " nnoremap <silent><F2> :AsyncTask! file-build-run<CR>
    nnoremap <silent><F2> :call hl#async_file_run()<CR>
    " nnoremap <silent><F6> :call hl#async_task('project-build-run')<CR>
    " nnoremap <silent><F7> :call hl#async_task('project-build')<CR>
    " nnoremap <silent><F8> :call hl#async_task('project-run')<CR>
endif
"}}}

" vim-qf {{{
if hl#plug_loaded('vim-qf')
    " nmap <F10> <Plug>(qf_qf_toggle)
endif
"}}}

" ctrlsf.vim{{{
if hl#plug_loaded('ctrlsf.vim')
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

if hl#plug_loaded('vim-gutentags')
    nmap <silent> <leader>cs <Plug>GscopeFindSymbol
    nmap <silent> <leader>cg <Plug>GscopeFindDefinition
    nmap <silent> <leader>cc <Plug>GscopeFindCallingFunc
    nmap <silent> <leader>ct <Plug>GscopeFindText
    nmap <silent> <leader>ce <Plug>GscopeFindEgrep
    nmap <silent> <leader>cf <Plug>GscopeFindFile
    nmap <silent> <leader>ci <Plug>GscopeFindInclude
    nmap <silent> <leader>cd <Plug>GscopeFindCalledFunc
    nmap <silent> <leader>ca <Plug>GscopeFindAssign
    nmap <silent> <leader>cz <Plug>GscopeFindCtag
    nmap <silent> <leader>ck :GscopeKill<cr>
endif

if hl#plug_loaded('vim-sandwich')
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

" coc.vim {{{
if hl#plug_loaded('coc.nvim')
    " inoremap <silent><expr> <CR>  pumvisible() && !empty(v:completed_item) ? "\<C-y>" : "\<C-g>u\<CR>"
    " inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
    inoremap <silent><expr> <CR> hl#operate#enter()
    " inoremap <silent><expr> <CR> "\<C-y>"
    " inoremap <silent><expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
    inoremap <silent><expr> <C-n> coc#pum#visible() ? coc#pum#next(0) : "\<Down>"
    inoremap <silent><expr> <C-p> coc#pum#visible() ? coc#pum#prev(0) : "\<Up>"
    nnoremap <silent>K          :call hl#ui#show_documentation()<CR>
    nmap <silent>gd             <Plug>(coc-definition)
    nmap <silent>gy             <Plug>(coc-type-definition)
    nmap <silent>gi             <Plug>(coc-implementation)
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
    nmap <silent>]e             <Plug>(coc-diagnostic-next)
    nmap <silent>[e             <Plug>(coc-diagnostic-prev)
    nmap <silent><Leader>fx     <Plug>(coc-fix-current)
    xmap <C-c>f  <Plug>(coc-format-selected)
    nmap <C-c>f  <Plug>(coc-format-selected)

    nmap <silent> <C-c>w <Plug>(coc-ci-w)
    nmap <silent> <C-c>b <Plug>(coc-ci-b)
    xmap <silent> <C-c>a <Plug>(coc-codeaction-selected)
    nmap <silent> <C-c>a <Plug>(coc-codeaction-selected)

    nmap <silent> <C-c>r <Plug>(coc-range-select)
    xmap <silent> <C-c>r <Plug>(coc-range-select)

    nmap <C-c>ac  <Plug>(coc-codeaction)

    nnoremap <silent><nowait> <C-c>l  :CocList<CR>
    nnoremap <silent><nowait> <M-c>   :<C-u>CocList commands<cr>
    nnoremap <silent><nowait> <C-c>c  :<C-u>CocList commands<cr>
    nnoremap <silent><nowait> <C-c>d  :<C-u>CocList diagnostics<cr>
    nnoremap <silent><nowait> <C-c>e  :<C-u>CocList extensions<cr>
    nnoremap <silent><nowait> <C-c>o  :<C-u>CocList outline<cr>
    nnoremap <silent><nowait> <C-c>s  :<C-u>CocList -I symbols<cr>
    nnoremap <silent><nowait> <C-c>y  :<C-u>CocList -A --normal yank<cr>
    nnoremap <silent><nowait> <C-c>r  :<C-u>CocListResume<CR>

    nnoremap <silent><nowait> <C-c>n  :<C-u>CocNext<CR>
    nnoremap <silent><nowait> <C-c>p  :<C-u>CocPrev<CR>

    " inoremap <silent><nowait><expr> <M-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
    " inoremap <silent><nowait><expr> <M-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
    " vnoremap <silent><nowait><expr> <M-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
    " vnoremap <silent><nowait><expr> <M-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"

    " inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
    " inoremap <silent><expr> <C-d> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
    " inoremap <silent><expr> <C-u> pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"

    " inoremap <silent><expr> <TAB>
    "             \ pumvisible() ? "\<C-n>" :
    "             \ <SID>check_back_space() ? "\<TAB>" :
    "             \ coc#refresh()
    " inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    " function! s:check_back_space() abort
    "     let col = col('.') - 1
    "     return !col || getline('.')[col - 1]  =~# '\s'
    " endfunction

endif
"}}}

" vim-dadbod{{{
if hl#plug_loaded('vim-dadbod')
    xnoremap <expr> <Plug>(DBExe)     db#op_exec()
    nnoremap <expr> <Plug>(DBExe)     db#op_exec()
    nnoremap <expr> <Plug>(DBExeLine) db#op_exec() . '_'

    xmap <leader>sq  <Plug>(DBExe)
    nmap <leader>sq  <Plug>(DBExe)
    omap <leader>sq  <Plug>(DBExe)
    nmap <leader>sql <Plug>(DBExeLine)
endif
"}}}


if hl#plug_loaded('vim-dadbod-ui')
    nnoremap <silent> <leader>qt :DBUIToggle<CR>
    nnoremap <silent> <leader>qf :DBUIFindBuffer<CR>
    nnoremap <silent> <leader>qr :DBUIRenameBuffer<CR>
    nnoremap <silent> <leader>ql :DBUILastQueryInfo<CR>
endif


" vim-gitgutter {{{
if hl#plug_loaded('vim-gitgutter')
    nmap [h  <Plug>(GitGutterPrevHunk)
    nmap [gh <Plug>(GitGutterPrevHunk)
    nmap ]h  <Plug>(GitGutterNextHunk)
    nmap ]gh <Plug>(GitGutterNextHunk)

    omap ih  <Plug>(GitGutterTextObjectInnerPending)
    omap ah  <Plug>(GitGutterTextObjectOuterPending)
    xmap ih  <Plug>(GitGutterTextObjectInnerVisual)
    xmap ah  <Plug>(GitGutterTextObjectOuterVisual)

    nmap <Leader>hi <Plug>(GitGutterPreviewHunk)
    nmap <Leader>hs <Plug>(GitGutterStageHunk)
    nmap <Leader>hu <Plug>(GitGutterUndoHunk)
endif
"}}}

" vim-easymotion {{{
if hl#plug_loaded('vim-easymotion')
    " nmap <Space><Space>     <Plug>(easymotion-bd-w)
    nmap F          <Plug>(easymotion-bd-w)
    xmap F          <Plug>(easymotion-bd-w)
    omap F          <Plug>(easymotion-bd-w)

    " " <Leader>f{char} to move to {char}
    " map  <Space>f           <Plug>(easymotion-bd-f)
    " " nmap <Leader>f          <Plug>(easymotion-overwin-f)

    " " s{char}{char} to move to {char}{char}
    " nmap <Space>2f           <Plug>(easymotion-bd-f2)
    " " nmap <Space>2f           <Plug>(easymotion-overwin-f2)

    " map <Space>l            <Plug>(easymotion-lineforward)
    " map <Space>j            <Plug>(easymotion-j)
    " map <Space>k            <Plug>(easymotion-k)
    " map <Space>h            <Plug>(easymotion-linebackward)
    " map <Space>L            <Plug>(easymotion-bd-jk)
    " " nmap <Leader>L          <Plug>(easymotion-overwin-line)

    " nmap <Space>s           <Plug>(easymotion-s)
    " nmap <Space>2s          <Plug>(easymotion-s2)
    " nmap <Space>t           <Plug>(easymotion-t)
    " nmap <Space>2t          <Plug>(easymotion-t2)

    " nmap <Space>p          <Plug>(easymotion-prev)
    " nmap <Space>n          <Plug>(easymotion-next)
endif
"}}}

" vim-oscyank {{{
if hl#plug_loaded('vim-oscyank')
    " vnoremap <Leader>oy :OSCYank<CR>
    nmap <Leader>oy <Plug>OSCYankOperator
    nmap <Leader>cc <leader>c_
    vmap <Leader>oy <Plug>OSCYankVisual
endif
"}}}

" eregex.vim {{{
if hl#plug_loaded('eregex.vim')
    nnoremap <leader>em :call eregex#toggle()<CR>
endif
" }}}

" vim-fugitive {{{
if hl#plug_loaded('vim-fugitive')
    nnoremap <silent>gs  :Git<CR>
endif
"}}}

" vista {{{
if hl#plug_loaded('vista')
    nnoremap <F4>                :Vista!!<CR>
endif
"}}}

" YouCompleteMe {{{
if hl#plug_loaded('YouCompleteMe')
    nnoremap gd                  :YcmCompleter GoTo<CR>
    " nnoremap <silent>K           <Plug>(YCMHover)
    nnoremap <silent><Leader>gr  :YcmCompleter GoToReferences<CR>
    nnoremap <silent><Leader>rn  :YcmCompleter RefactorRename<Space><C-R><C-W>
endif
"}}}

" ale {{{
if hl#plug_loaded('ale')
    nmap <Leader>en       <Plug>(ale_next)
    nmap <Leader>ep       <Plug>(ale_previous)
endif
"}}}

if hl#plug_loaded('vim-which-key')
    nnoremap <silent><Leader> :WhichKey '<Leader>'<CR>
endif

if hl#plug_loaded('vim-table-mode')
    " we can't use nmap <Leader>tr <Plug>(table-mode-realign), because it will raise error
    nnoremap <silent><Leader>tr :TableModeRealign<CR>
endif
