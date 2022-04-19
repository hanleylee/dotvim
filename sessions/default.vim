let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <expr> <Plug>(coc-snippets-expand-jump) coc#_insert_key('request', 'snippets-expand-jump', 1)
inoremap <silent> <expr> <Plug>(coc-snippets-expand) coc#_insert_key('request', 'snippets-expand', 1)
inoremap <D-BS> 
inoremap <M-BS> 
inoremap <M-Down> }
inoremap <D-Down> <C-End>
inoremap <M-Up> {
inoremap <D-Up> <C-Home>
noremap! <M-Right> <C-Right>
noremap! <D-Right> <End>
noremap! <M-Left> <C-Left>
noremap! <D-Left> <Home>
inoremap <silent> <Plug>CocRefresh =coc#_complete()
inoremap <silent> <Plug>(table-mode-tableize) |:call tablemode#TableizeInsertMode()a
imap <C-G>S <Plug>ISurround
imap <C-G>s <Plug>Isurround
inoremap <silent> <SNR>180_AutoPairsReturn =AutoPairsReturn()
imap <silent> <C-G>% <Plug>(matchup-c_g%)
inoremap <silent> <Plug>(matchup-c_g%) :call matchup#motion#insert_mode()
inoremap <silent> <Plug>(fzf-maps-i) :call fzf#vim#maps('i', 0)
inoremap <expr> <Plug>(fzf-complete-buffer-line) fzf#vim#complete#buffer_line()
inoremap <expr> <Plug>(fzf-complete-line) fzf#vim#complete#line()
inoremap <expr> <Plug>(fzf-complete-file-ag) fzf#vim#complete#path('ag -l -g ""')
inoremap <expr> <Plug>(fzf-complete-file) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -type f -print -o -type l -print | sed 's:^..::'")
inoremap <expr> <Plug>(fzf-complete-path) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -print | sed '1d;s:^..::'")
inoremap <expr> <Plug>(fzf-complete-word) fzf#vim#complete#word()
inoremap <C-S>t :CtrlSFToggle
imap <C-X><C-L> <Plug>(fzf-complete-line)
inoremap <expr> <C-X><C-F> fzf#vim#complete#path('fd')
inoremap <expr> <C-X><C-K> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
imap <C-X><C-M> <Plug>(fzf-maps-i)
cnoremap <C-B> <Left>
inoremap <C-B> <Left>
cnoremap <C-F> <Right>
inoremap <C-F> <Right>
cnoremap <C-A> <Home>
inoremap <C-A> <Home>
cnoremap <C-E> <End>
inoremap <C-E> <End>
imap <silent> <S-CR> <C-CR>==O
inoremap <silent> <expr> <C-CR> hl#insert_map_for_ctrl_enter()
inoremap <silent> <C-S> :update
cnoremap <silent> <M-t> ‚¶ø
inoremap <silent> <M-t> ‚¶ø
inoremap <M-,> m`A,``
inoremap <M-;> m`A;``
inoremap <expr> <M-B> hl#move_any_char_to_left()
cnoremap <M-b> <C-Left>
inoremap <M-b> <C-Left>
cnoremap <M-f> <C-Right>
inoremap <M-f> <C-Right>
nnoremap <silent>  :Buffers
nnoremap <nowait> <silent> p :CocPrev
nnoremap <nowait> <silent> n :CocNext
nnoremap <nowait> <silent> y :CocList -A --normal yank
nnoremap <nowait> <silent> s :CocList -I symbols
nnoremap <nowait> <silent> o :CocList outline
nnoremap <nowait> <silent> c :CocList commands
nnoremap <nowait> <silent> e :CocList extensions
nnoremap <nowait> <silent> d :CocList diagnostics
nnoremap <nowait> <silent> l :CocList
nmap ac <Plug>(coc-codeaction)
xmap <silent> r <Plug>(coc-range-select)
nnoremap <nowait> <silent> r :CocListResume
nmap a <Plug>(coc-codeaction-selected)
xmap a <Plug>(coc-codeaction-selected)
nmap f <Plug>(coc-format-selected)
xmap f <Plug>(coc-format-selected)
nnoremap <silent>  :Files
nnoremap  :call EchoPath()
nnoremap <silent>  :History
noremap <silent> 	p :tabp
noremap <silent> 	n :tabn
noremap <silent> 	c :tabclose
noremap <silent> 	m :tabnew
vnoremap <NL> :m'>+gv
nnoremap <NL> :m+
vnoremap  :m'<-2gv
nnoremap  :m-2
nnoremap <silent>  :FloatermNew lf
xmap <nowait>  <Plug>(VM-Find-Subword-Under)
nmap <nowait>  <Plug>(VM-Find-Under)
nnoremap <silent>  :x
nnoremap t :CtrlSFToggle
nnoremap o :CtrlSFOpen
nmap p <Plug>CtrlSFPwordPath
nmap n <Plug>CtrlSFCwordPath
vmap F <Plug>CtrlSFVwordExec
vmap f <Plug>CtrlSFVwordPath
nmap f <Plug>CtrlSFPrompt
vnoremap <silent>  :update
nnoremap <silent>  :update
omap  <Plug>(fzf-maps-o)
xmap  <Plug>(fzf-maps-x)
nmap  <Plug>(fzf-maps-n)
nmap   za
xnoremap # :call VisualStarSearchSet('?')?=@/
omap <silent> % <Ignore><Plug>(matchup-%)
xmap <silent> % <Plug>(matchup-%)
nmap <silent> % <Plug>(matchup-%)
nnoremap <silent> '[ :call signature#mark#Goto("prev", "line", "alpha")
nnoremap <silent> '] :call signature#mark#Goto("next", "line", "alpha")
xnoremap * :call VisualStarSearchSet('/')/=@/
nnoremap <silent> - :Fern . -reveal=%
nmap <p <Plug>(unimpaired-put-below-leftward)
nmap <P <Plug>(unimpaired-put-above-leftward)
nmap <s <Plug>(unimpaired-enable)
nmap =p <Plug>(unimpaired-put-below-reformat)
nmap =P <Plug>(unimpaired-put-above-reformat)
nmap =s <Plug>(unimpaired-toggle)
nmap >p <Plug>(unimpaired-put-below-rightward)
nmap >P <Plug>(unimpaired-put-above-rightward)
nmap >s <Plug>(unimpaired-disable)
xnoremap <silent> @(targets) :call targets#do()
onoremap <silent> @(targets) :call targets#do()
xmap <expr> A targets#e('o', 'A', 'A')
omap <expr> A targets#e('o', 'A', 'A')
inoremap ¬¨ m`A,``
inoremap ¬ª m`A;``
cnoremap <silent> √¥ ‚¶ø
inoremap <silent> √¥ ‚¶ø
inoremap <expr> √Ç hl#move_any_char_to_left()
cnoremap √¢ <C-Left>
inoremap √¢ <C-Left>
cnoremap √¶ <C-Right>
inoremap √¶ <C-Right>
xmap <expr> I targets#e('o', 'I', 'I')
omap <expr> I targets#e('o', 'I', 'I')
vnoremap <silent> K :call hl#quickui#show_context(hl#visual_selection())
nnoremap <silent> K :call hl#quickui#show_context(expand("<cword>"))
xmap S <Plug>VSurround
xmap X <Plug>(Exchange)
nnoremap Y y$
vmap ZF :execute "normal! '<O\<ESC>'>o\<ESC>V'<kzf"
nnoremap <silent> [= :call signature#marker#Goto("prev", "any",  v:count)
nnoremap <silent> [- :call signature#marker#Goto("prev", "same", v:count)
nnoremap <silent> [` :call signature#mark#Goto("prev", "spot", "pos")
nnoremap <silent> [' :call signature#mark#Goto("prev", "line", "pos")
nmap [xx <Plug>(unimpaired-xml-encode-line)
xmap [x <Plug>(unimpaired-xml-encode)
nmap [x <Plug>(unimpaired-xml-encode)
nmap [uu <Plug>(unimpaired-url-encode-line)
xmap [u <Plug>(unimpaired-url-encode)
nmap [u <Plug>(unimpaired-url-encode)
nmap [CC <Plug>(unimpaired-string-encode-line)
xmap [C <Plug>(unimpaired-string-encode)
nmap [C <Plug>(unimpaired-string-encode)
nmap [yy <Plug>(unimpaired-string-encode-line)
xmap [y <Plug>(unimpaired-string-encode)
nmap [y <Plug>(unimpaired-string-encode)
nmap [P <Plug>(unimpaired-put-above)
nmap [p <Plug>(unimpaired-put-above)
nmap [o <Plug>(unimpaired-enable)
xmap [e <Plug>(unimpaired-move-selection-up)
nmap [e <Plug>(unimpaired-move-up)
nmap [  <Plug>(unimpaired-blank-up)
omap [n <Plug>(unimpaired-context-previous)
xmap [n <Plug>(unimpaired-context-previous)
nmap [n <Plug>(unimpaired-context-previous)
nmap [f <Plug>(unimpaired-directory-previous)
nmap [<C-T> <Plug>(unimpaired-ptprevious)
nmap [ <Plug>(unimpaired-ptprevious)
nmap [T <Plug>(unimpaired-tfirst)
nmap [t <Plug>(unimpaired-tprevious)
nmap [<C-Q> <Plug>(unimpaired-cpfile)
nmap [ <Plug>(unimpaired-cpfile)
nmap [Q <Plug>(unimpaired-cfirst)
nmap [q <Plug>(unimpaired-cprevious)
nmap [<C-L> <Plug>(unimpaired-lpfile)
nmap [ <Plug>(unimpaired-lpfile)
nmap [L <Plug>(unimpaired-lfirst)
nmap [l <Plug>(unimpaired-lprevious)
nmap [B <Plug>(unimpaired-bfirst)
nmap [b <Plug>(unimpaired-bprevious)
nmap [A <Plug>(unimpaired-first)
nmap [a <Plug>(unimpaired-previous)
omap <silent> [% <Plug>(matchup-[%)
xmap <silent> [% <Plug>(matchup-[%)
nmap <silent> [% <Plug>(matchup-[%)
nmap [h <Plug>(GitGutterPrevHunk)
vmap <silent> []  :execute "normal '<[\ '>]\ "
nmap <silent> []  :execute "normal [\ ]\ "
vnoremap <silent> \w :SendLineToREPL
nnoremap <silent> \w :SendCurrentLine
xmap <nowait> \\c <Plug>(VM-Visual-Cursors)
nmap <nowait> \\gS <Plug>(VM-Reselect-Last)
nmap <nowait> \\/ <Plug>(VM-Start-Regex-Search)
nmap <nowait> \\\ <Plug>(VM-Add-Cursor-At-Pos)
xmap <nowait> \\a <Plug>(VM-Visual-Add)
xmap <nowait> \\f <Plug>(VM-Visual-Find)
xmap <nowait> \\/ <Plug>(VM-Visual-Regex)
xmap <nowait> \\A <Plug>(VM-Visual-All)
nmap <nowait> \\A <Plug>(VM-Select-All)
xmap \T <Plug>(table-mode-tableize-delimiter)
xmap \tt <Plug>(table-mode-tableize)
nmap \tt <Plug>(table-mode-tableize)
nnoremap <silent> \tm :call tablemode#Toggle()
map \\ <Plug>(easymotion-prefix)
xnoremap \ie :InlineEdit
nnoremap \ie :InlineEdit
vnoremap \oy :OSCYank
nmap \L <Plug>(easymotion-overwin-line)
vmap \L <Plug>(easymotion-bd-jk)
omap \L <Plug>(easymotion-bd-jk)
vmap \  <Plug>(easymotion-bd-w)
nmap \  <Plug>(easymotion-bd-w)
nmap \hu <Plug>(GitGutterUndoHunk)
nmap \hs <Plug>(GitGutterStageHunk)
nmap \hp <Plug>(GitGutterPreviewHunk)
nnoremap <silent> \ql :DBUILastQueryInfo
nnoremap <silent> \qr :DBUIRenameBuffer
nnoremap <silent> \qf :DBUIFindBuffer
nmap \sql <Plug>(DBExeLine)
omap \sq <Plug>(DBExe)
nmap \sq <Plug>(DBExe)
xmap \sq <Plug>(DBExe)
nmap <silent> \fx <Plug>(coc-fix-current)
nmap <silent> \ep <Plug>(coc-diagnostic-prev)
nmap <silent> \en <Plug>(coc-diagnostic-next)
nmap <silent> \rn <Plug>(coc-rename)
nnoremap <silent> \K :call hl#show_documentation()
nmap <silent> \ck :GscopeKill
nmap <silent> \cz <Plug>GscopeFindCtag
nmap <silent> \ca <Plug>GscopeFindAssign
nmap <silent> \cd <Plug>GscopeFindCalledFunc
nmap <silent> \ci <Plug>GscopeFindInclude
nmap <silent> \cf <Plug>GscopeFindFile
nmap <silent> \ce <Plug>GscopeFindEgrep
nmap <silent> \ct <Plug>GscopeFindText
nmap <silent> \cc <Plug>GscopeFindCallingFunc
nmap <silent> \cg <Plug>GscopeFindDefinition
nmap <silent> \cs <Plug>GscopeFindSymbol
nnoremap \fc :Commits
nnoremap \ft :Tags
nnoremap \f? :GFiles?
nnoremap \fg :GFiles
nnoremap \fb :BCommits
nnoremap \fl :Lines
nnoremap \fAA :AgAll
nnoremap \fAH :AgWithHidden
nnoremap \fa :Ag
nmap <silent> \tv :TestVisit
nmap <silent> \tl :TestLast
nmap <silent> \tf :TestFile
nmap \rc :Ren
nmap \rr :Renamer %:p:h
vnoremap <silent> \qt :call hl#quickui#show_translate(hl#visual_selection())
nnoremap <silent> \qt :DBUIToggle
vnoremap <silent> \qd :call hl#quickui#show_dict(hl#visual_selection())
nnoremap <silent> \qd :call hl#quickui#show_dict(expand("<cword>"))
nnoremap <silent> \qm :call hl#quickui#quick_menu()
nnoremap <silent> \qp :call quickui#tools#preview_tag('')
nnoremap <silent> \lg :FloatermNew lazygit
nnoremap <silent> \lf :FloatermNew lf
nnoremap <silent> \tcd :FloatermSend cd %:p:h
tnoremap <silent> \tk :FloatermKill
nnoremap <silent> \tk :FloatermKill
tnoremap <silent> \te :FloatermLast
nnoremap <silent> \te :FloatermLast
tnoremap <silent> \ts :FloatermFirst
nmap <silent> \ts :TestSuite
tnoremap <silent> \tn :FloatermNext
nmap <silent> \tn :TestNearest
tnoremap <silent> \tp :FloatermPrev
nnoremap <silent> \tp :FloatermPrev
tnoremap <silent> \tw :FloatermNew
nnoremap <silent> \tw :FloatermNew
vnoremap <silent> \af :call hl#format_document('v')
nnoremap <silent> \af :call hl#format_document('n')
nmap \do :VimspectorShowOutput 
nmap \dw :VimspectorWatch 
nmap \de :VimspectorEval 
nmap \drc <Plug>VimspectorRunToCursor
nmap \dl <Plug>VimspectorStepOver
nmap \dk <Plug>VimspectorStepOut
nmap \dj <Plug>VimspectorStepInto
xmap \di <Plug>VimspectorBalloonEval
nmap \di <Plug>VimspectorBalloonEval
nmap \ds <Plug>VimspectorStop
nmap \dp <Plug>VimspectorPause
nmap \dr <Plug>VimspectorRestart
nmap \dX :call vimspector#ClearBreakpoints()
nmap \dx :call vimspector#Reset()
nmap \dc <Plug>VimspectorContinue
nmap \dd <Plug>VimspectorContinue
nmap \d_. <Plug>VimspectorToggleConditionalBreakpoint
nmap \d. <Plug>VimspectorToggleBreakpoint
vnoremap \* :call VisualStarSearchSet('/'):execute 'noautocmd vimgrep /' . @/ . '/ **'
nnoremap \* :execute 'noautocmd vimgrep /\V' . substitute(escape(expand("<cword>"), '\'), '\n', '\\n', 'g') . '/ **'
nnoremap \J ddpkJ
nnoremap \ma :ChezmoiApply
nnoremap \ms :ChezmoiSwap
nnoremap <silent> ]= :call signature#marker#Goto("next", "any",  v:count)
nnoremap <silent> ]- :call signature#marker#Goto("next", "same", v:count)
nnoremap <silent> ]` :call signature#mark#Goto("next", "spot", "pos")
nnoremap <silent> ]' :call signature#mark#Goto("next", "line", "pos")
nmap ]xx <Plug>(unimpaired-xml-decode-line)
xmap ]x <Plug>(unimpaired-xml-decode)
nmap ]x <Plug>(unimpaired-xml-decode)
nmap ]uu <Plug>(unimpaired-url-decode-line)
xmap ]u <Plug>(unimpaired-url-decode)
nmap ]u <Plug>(unimpaired-url-decode)
nmap ]CC <Plug>(unimpaired-string-decode-line)
xmap ]C <Plug>(unimpaired-string-decode)
nmap ]C <Plug>(unimpaired-string-decode)
nmap ]yy <Plug>(unimpaired-string-decode-line)
xmap ]y <Plug>(unimpaired-string-decode)
nmap ]y <Plug>(unimpaired-string-decode)
nmap ]P <Plug>(unimpaired-put-below)
nmap ]p <Plug>(unimpaired-put-below)
nmap ]o <Plug>(unimpaired-disable)
xmap ]e <Plug>(unimpaired-move-selection-down)
nmap ]e <Plug>(unimpaired-move-down)
nmap ]  <Plug>(unimpaired-blank-down)
omap ]n <Plug>(unimpaired-context-next)
xmap ]n <Plug>(unimpaired-context-next)
nmap ]n <Plug>(unimpaired-context-next)
nmap ]f <Plug>(unimpaired-directory-next)
nmap ]<C-T> <Plug>(unimpaired-ptnext)
nmap ] <Plug>(unimpaired-ptnext)
nmap ]T <Plug>(unimpaired-tlast)
nmap ]t <Plug>(unimpaired-tnext)
nmap ]<C-Q> <Plug>(unimpaired-cnfile)
nmap ] <Plug>(unimpaired-cnfile)
nmap ]Q <Plug>(unimpaired-clast)
nmap ]q <Plug>(unimpaired-cnext)
nmap ]<C-L> <Plug>(unimpaired-lnfile)
nmap ] <Plug>(unimpaired-lnfile)
nmap ]L <Plug>(unimpaired-llast)
nmap ]l <Plug>(unimpaired-lnext)
nmap ]B <Plug>(unimpaired-blast)
nmap ]b <Plug>(unimpaired-bnext)
nmap ]A <Plug>(unimpaired-last)
nmap ]a <Plug>(unimpaired-next)
omap <silent> ]% <Plug>(matchup-]%)
xmap <silent> ]% <Plug>(matchup-]%)
nmap <silent> ]% <Plug>(matchup-]%)
nmap ]h <Plug>(GitGutterNextHunk)
nnoremap <silent> `[ :call signature#mark#Goto("prev", "spot", "alpha")
nnoremap <silent> `] :call signature#mark#Goto("next", "spot", "alpha")
xmap <expr> a targets#e('o', 'a', 'a')
omap <expr> a targets#e('o', 'a', 'a')
omap ae <Plug>(textobj-entire-a)
xmap ae <Plug>(textobj-entire-a)
omap ay <Plug>(textobj-syntax-a)
xmap ay <Plug>(textobj-syntax-a)
omap al <Plug>(textobj-line-a)
xmap al <Plug>(textobj-line-a)
omap az <Plug>(textobj-fold-a)
xmap az <Plug>(textobj-fold-a)
omap ai <Plug>(textobj-indent-a)
xmap ai <Plug>(textobj-indent-a)
omap aI <Plug>(textobj-indent-same-a)
xmap aI <Plug>(textobj-indent-same-a)
omap <silent> a% <Plug>(matchup-a%)
xmap <silent> a% <Plug>(matchup-a%)
xmap ah <Plug>(GitGutterTextObjectOuterVisual)
omap ah <Plug>(GitGutterTextObjectOuterPending)
omap ac <Plug>(coc-classobj-a)
xmap ac <Plug>(coc-classobj-a)
omap af <Plug>(coc-funcobj-a)
xmap af <Plug>(coc-funcobj-a)
nmap cxx <Plug>(ExchangeLine)
nmap cxc <Plug>(ExchangeClear)
nmap cx <Plug>(Exchange)
nmap cS <Plug>CSurround
nmap cs <Plug>Csurround
nnoremap cd :lcd %:p:h:echo expand('%:p:h')
nmap ds <Plug>Dsurround
nnoremap <silent> dm :call signature#utils#Remove(v:count)
nmap do] ds]db
nmap do) ds)db
xmap g! <Plug>ScripteaseFilter
nmap g! <Plug>ScripteaseFilter
xmap g= <Plug>ScripteaseFilter
nmap g= <Plug>ScripteaseFilter
xmap gS <Plug>VgSurround
nmap gcu <Plug>Commentary<Plug>Commentary
nmap gcc <Plug>CommentaryLine
omap gc <Plug>Commentary
nmap gc <Plug>Commentary
xmap gc <Plug>Commentary
omap <silent> g% <Ignore><Plug>(matchup-g%)
xmap <silent> g% <Plug>(matchup-g%)
nmap <silent> g% <Plug>(matchup-g%)
nnoremap <silent> gs :Git
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gm <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gd <Plug>(coc-definition)
vmap <silent> gx :silent call OpenInBrowser('v')
nmap <silent> gx :silent call OpenInBrowser('n')
vnoremap ge :call hl#grep_operator(visualmode())
nnoremap ge :set operatorfunc=hl#grep_operatorg@
xmap <expr> i targets#e('o', 'i', 'i')
omap <expr> i targets#e('o', 'i', 'i')
omap ie <Plug>(textobj-entire-i)
xmap ie <Plug>(textobj-entire-i)
omap iy <Plug>(textobj-syntax-i)
xmap iy <Plug>(textobj-syntax-i)
omap il <Plug>(textobj-line-i)
xmap il <Plug>(textobj-line-i)
omap iz <Plug>(textobj-fold-i)
xmap iz <Plug>(textobj-fold-i)
omap ii <Plug>(textobj-indent-i)
xmap ii <Plug>(textobj-indent-i)
omap iI <Plug>(textobj-indent-same-i)
xmap iI <Plug>(textobj-indent-same-i)
omap <silent> i% <Plug>(matchup-i%)
xmap <silent> i% <Plug>(matchup-i%)
xmap ih <Plug>(GitGutterTextObjectInnerVisual)
omap ih <Plug>(GitGutterTextObjectInnerPending)
omap ic <Plug>(coc-classobj-i)
xmap ic <Plug>(coc-classobj-i)
omap if <Plug>(coc-funcobj-i)
xmap if <Plug>(coc-funcobj-i)
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <silent> m? :call signature#marker#List(v:count, 0)
nnoremap <silent> m/ :call signature#mark#List(0, 0)
nnoremap <silent> m<BS> :call signature#marker#Purge()
nnoremap <silent> m  :call signature#mark#Purge("all")
nnoremap <silent> m- :call signature#mark#Purge("line")
nnoremap <silent> m. :call signature#mark#ToggleAtLine()
nnoremap <silent> m, :call signature#mark#Toggle("next")
nnoremap <silent> m :call signature#utils#Input()
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
nmap yo <Plug>(unimpaired-toggle)
nmap zS <Plug>ScripteaseSynnames
omap <silent> z% <Plug>(matchup-z%)
xmap <silent> z% <Plug>(matchup-z%)
nmap <silent> z% <Plug>(matchup-z%)
nmap zuz <Plug>(FastFoldUpdate)
vnoremap <silent> <Plug>(coc-snippets-select) :call coc#rpc#notify('doKeymap', ['snippets-select'])
xnoremap <silent> <Plug>(coc-convert-snippet) :call coc#rpc#notify('doKeymap', ['convert-snippet'])
nnoremap <SNR>274_: :=v:count ? v:count : ''
noremap <M-Down> }
noremap <D-Down> <C-End>
noremap <M-Up> {
noremap <D-Up> <C-Home>
noremap <M-Right> <C-Right>
noremap <D-Right> <End>
noremap <M-Left> <C-Left>
noremap <D-Left> <Home>
xnoremap <silent> <Plug>(openbrowser-smart-search) :call openbrowser#_keymap_smart_search('v')
nnoremap <silent> <Plug>(openbrowser-smart-search) :call openbrowser#_keymap_smart_search('n')
xnoremap <silent> <Plug>(openbrowser-search) :call openbrowser#_keymap_search('v')
nnoremap <silent> <Plug>(openbrowser-search) :call openbrowser#_keymap_search('n')
xnoremap <silent> <Plug>(openbrowser-open-incognito) :call openbrowser#_keymap_open('v', 0, ['--incognito'])
nnoremap <silent> <Plug>(openbrowser-open-incognito) :call openbrowser#_keymap_open('n', 0, ['--incognito'])
xnoremap <silent> <Plug>(openbrowser-open) :call openbrowser#_keymap_open('v')
nnoremap <silent> <Plug>(openbrowser-open) :call openbrowser#_keymap_open('n')
noremap <SNR>234_DashGlobalSearch :Dash!
noremap <SNR>234_DashSearch :Dash
nnoremap <silent> <Plug>ScripteaseSynnames :exe scriptease#synnames_map(v:count)
onoremap <SNR>231__ _
xnoremap <expr> <Plug>ScripteaseFilter scriptease#filterop()
nnoremap <expr> <Plug>ScripteaseFilter scriptease#filterop()
nnoremap <silent> <Plug>VimspectorBreakpoints :call vimspector#ListBreakpoints()
nnoremap <silent> <Plug>VimspectorDownFrame :call vimspector#DownFrame()
nnoremap <silent> <Plug>VimspectorUpFrame :call vimspector#UpFrame()
xnoremap <silent> <Plug>VimspectorBalloonEval :call vimspector#ShowEvalBalloon( 1 )
nnoremap <silent> <Plug>VimspectorBalloonEval :call vimspector#ShowEvalBalloon( 0 )
nnoremap <silent> <Plug>VimspectorGoToCurrentLine :call vimspector#GoToCurrentLine()
nnoremap <silent> <Plug>VimspectorRunToCursor :call vimspector#RunToCursor()
nnoremap <silent> <Plug>VimspectorStepOut :call vimspector#StepOut()
nnoremap <silent> <Plug>VimspectorStepInto :call vimspector#StepInto()
nnoremap <silent> <Plug>VimspectorStepOver :call vimspector#StepOver()
nnoremap <silent> <Plug>VimspectorAddFunctionBreakpoint :call vimspector#AddFunctionBreakpoint( expand( '<cexpr>' ) )
nnoremap <silent> <Plug>VimspectorToggleConditionalBreakpoint :call vimspector#ToggleAdvancedBreakpoint()
nnoremap <silent> <Plug>VimspectorToggleBreakpoint :call vimspector#ToggleBreakpoint()
nnoremap <silent> <Plug>VimspectorPause :call vimspector#Pause()
nnoremap <silent> <Plug>VimspectorRestart :call vimspector#Restart()
nnoremap <silent> <Plug>VimspectorStop :call vimspector#Stop()
nnoremap <silent> <Plug>VimspectorLaunch :call vimspector#Launch( v:true )
nnoremap <silent> <Plug>VimspectorContinue :call vimspector#Continue()
onoremap <silent> <Plug>(coc-classobj-a) :call CocAction('selectSymbolRange', v:false, '', ['Interface', 'Struct', 'Class'])
onoremap <silent> <Plug>(coc-classobj-i) :call CocAction('selectSymbolRange', v:true, '', ['Interface', 'Struct', 'Class'])
vnoremap <silent> <Plug>(coc-classobj-a) :call CocAction('selectSymbolRange', v:false, visualmode(), ['Interface', 'Struct', 'Class'])
vnoremap <silent> <Plug>(coc-classobj-i) :call CocAction('selectSymbolRange', v:true, visualmode(), ['Interface', 'Struct', 'Class'])
onoremap <silent> <Plug>(coc-funcobj-a) :call CocAction('selectSymbolRange', v:false, '', ['Method', 'Function'])
onoremap <silent> <Plug>(coc-funcobj-i) :call CocAction('selectSymbolRange', v:true, '', ['Method', 'Function'])
vnoremap <silent> <Plug>(coc-funcobj-a) :call CocAction('selectSymbolRange', v:false, visualmode(), ['Method', 'Function'])
vnoremap <silent> <Plug>(coc-funcobj-i) :call CocAction('selectSymbolRange', v:true, visualmode(), ['Method', 'Function'])
nnoremap <silent> <Plug>(coc-cursors-position) :call CocAction('cursorsSelect', bufnr('%'), 'position', 'n')
nnoremap <silent> <Plug>(coc-cursors-word) :call CocAction('cursorsSelect', bufnr('%'), 'word', 'n')
vnoremap <silent> <Plug>(coc-cursors-range) :call CocAction('cursorsSelect', bufnr('%'), 'range', visualmode())
nnoremap <silent> <Plug>(coc-refactor) :call       CocActionAsync('refactor')
nnoremap <silent> <Plug>(coc-command-repeat) :call       CocAction('repeatCommand')
nnoremap <silent> <Plug>(coc-float-jump) :call       coc#float#jump()
nnoremap <silent> <Plug>(coc-float-hide) :call       coc#float#close_all()
nnoremap <silent> <Plug>(coc-fix-current) :call       CocActionAsync('doQuickfix')
nnoremap <silent> <Plug>(coc-openlink) :call       CocActionAsync('openLink')
nnoremap <silent> <Plug>(coc-references-used) :call       CocActionAsync('jumpUsed')
nnoremap <silent> <Plug>(coc-references) :call       CocActionAsync('jumpReferences')
nnoremap <silent> <Plug>(coc-type-definition) :call       CocActionAsync('jumpTypeDefinition')
nnoremap <silent> <Plug>(coc-implementation) :call       CocActionAsync('jumpImplementation')
nnoremap <silent> <Plug>(coc-declaration) :call       CocActionAsync('jumpDeclaration')
nnoremap <silent> <Plug>(coc-definition) :call       CocActionAsync('jumpDefinition')
nnoremap <silent> <Plug>(coc-diagnostic-prev-error) :call       CocActionAsync('diagnosticPrevious', 'error')
nnoremap <silent> <Plug>(coc-diagnostic-next-error) :call       CocActionAsync('diagnosticNext',     'error')
nnoremap <silent> <Plug>(coc-diagnostic-prev) :call       CocActionAsync('diagnosticPrevious')
nnoremap <silent> <Plug>(coc-diagnostic-next) :call       CocActionAsync('diagnosticNext')
nnoremap <silent> <Plug>(coc-diagnostic-info) :call       CocActionAsync('diagnosticInfo')
nnoremap <silent> <Plug>(coc-format) :call       CocActionAsync('format')
nnoremap <silent> <Plug>(coc-rename) :call       CocActionAsync('rename')
nnoremap <Plug>(coc-codeaction-cursor) :call       CocActionAsync('codeAction',         'cursor')
nnoremap <Plug>(coc-codeaction-line) :call       CocActionAsync('codeAction',         'line')
nnoremap <Plug>(coc-codeaction) :call       CocActionAsync('codeAction',         '')
vnoremap <silent> <Plug>(coc-codeaction-selected) :call       CocActionAsync('codeAction',         visualmode())
vnoremap <silent> <Plug>(coc-format-selected) :call       CocActionAsync('formatSelected',     visualmode())
nnoremap <Plug>(coc-codelens-action) :call       CocActionAsync('codeLensAction')
nnoremap <Plug>(coc-range-select) :call       CocActionAsync('rangeSelect',     '', v:true)
vnoremap <silent> <Plug>(coc-range-select-backward) :call       CocActionAsync('rangeSelect',     visualmode(), v:false)
vnoremap <silent> <Plug>(coc-range-select) :call       CocActionAsync('rangeSelect',     visualmode(), v:true)
nnoremap <silent> <Plug>(FastFoldUpdate) :FastFoldUpdate!
nnoremap <silent> <expr> <Plug>(qf_qf_switch) &filetype ==# 'qf' ? 'p' : 'b'
nnoremap <silent> <Plug>(qf_loc_toggle_stay) : call qf#toggle#ToggleLocWindow(1)
nnoremap <silent> <Plug>(qf_loc_toggle) : call qf#toggle#ToggleLocWindow(0)
nnoremap <silent> <Plug>(qf_qf_toggle_stay) : call qf#toggle#ToggleQfWindow(1)
nnoremap <silent> <Plug>(qf_qf_toggle) : call qf#toggle#ToggleQfWindow(0)
nnoremap <silent> <Plug>(qf_loc_next) : call qf#wrap#WrapCommand('down', 'l')
nnoremap <silent> <Plug>(qf_loc_previous) : call qf#wrap#WrapCommand('up', 'l')
nnoremap <silent> <Plug>(qf_qf_next) : call qf#wrap#WrapCommand('down', 'c')
nnoremap <silent> <Plug>(qf_qf_previous) : call qf#wrap#WrapCommand('up', 'c')
nmap <silent> <expr> <Plug>QfSwitch &filetype ==# 'qf' ? 'p' : 'b'
nmap <silent> <Plug>QfLtoggle <Plug>(qf_loc_toggle)
nmap <silent> <Plug>QfCtoggle <Plug>(qf_qf_toggle)
nmap <silent> <Plug>QfLnext <Plug>(qf_loc_next)
nmap <silent> <Plug>QfLprevious <Plug>(qf_loc_previous)
nmap <silent> <Plug>QfCnext <Plug>(qf_qf_next)
nmap <silent> <Plug>QfCprevious <Plug>(qf_qf_previous)
noremap <Plug>RenamerStart :call StartRenamer(1,-1,getcwd())
nnoremap <silent> <Plug>GitGutterPreviewHunk :call gitgutter#utility#warn('Please change your map <Plug>GitGutterPreviewHunk to <Plug>(GitGutterPreviewHunk)')
nnoremap <silent> <Plug>(GitGutterPreviewHunk) :GitGutterPreviewHunk
nnoremap <silent> <Plug>GitGutterUndoHunk :call gitgutter#utility#warn('Please change your map <Plug>GitGutterUndoHunk to <Plug>(GitGutterUndoHunk)')
nnoremap <silent> <Plug>(GitGutterUndoHunk) :GitGutterUndoHunk
nnoremap <silent> <Plug>GitGutterStageHunk :call gitgutter#utility#warn('Please change your map <Plug>GitGutterStageHunk to <Plug>(GitGutterStageHunk)')
nnoremap <silent> <Plug>(GitGutterStageHunk) :GitGutterStageHunk
xnoremap <silent> <Plug>GitGutterStageHunk :call gitgutter#utility#warn('Please change your map <Plug>GitGutterStageHunk to <Plug>(GitGutterStageHunk)')
xnoremap <silent> <Plug>(GitGutterStageHunk) :GitGutterStageHunk
nnoremap <silent> <expr> <Plug>GitGutterPrevHunk &diff ? '[c' : ":\call gitgutter#utility#warn('Please change your map \<Plug>GitGutterPrevHunk to \<Plug>(GitGutterPrevHunk)')\"
nnoremap <silent> <expr> <Plug>(GitGutterPrevHunk) &diff ? '[c' : ":\execute v:count1 . 'GitGutterPrevHunk'\"
nnoremap <silent> <expr> <Plug>GitGutterNextHunk &diff ? ']c' : ":\call gitgutter#utility#warn('Please change your map \<Plug>GitGutterNextHunk to \<Plug>(GitGutterNextHunk)')\"
nnoremap <silent> <expr> <Plug>(GitGutterNextHunk) &diff ? ']c' : ":\execute v:count1 . 'GitGutterNextHunk'\"
xnoremap <silent> <Plug>(GitGutterTextObjectOuterVisual) :call gitgutter#hunk#text_object(0)
xnoremap <silent> <Plug>(GitGutterTextObjectInnerVisual) :call gitgutter#hunk#text_object(1)
onoremap <silent> <Plug>(GitGutterTextObjectOuterPending) :call gitgutter#hunk#text_object(0)
onoremap <silent> <Plug>(GitGutterTextObjectInnerPending) :call gitgutter#hunk#text_object(1)
nmap <nowait> <C-Down> <Plug>(VM-Add-Cursor-Down)
xmap <nowait> <C-N> <Plug>(VM-Find-Subword-Under)
nmap <nowait> <C-Up> <Plug>(VM-Add-Cursor-Up)
nmap <nowait> <S-Right> <Plug>(VM-Select-l)
nmap <nowait> <S-Left> <Plug>(VM-Select-h)
nmap <nowait> <C-N> <Plug>(VM-Find-Under)
nnoremap <silent> <Plug>(VM-Select-BBW) :call vm#commands#motion('BBW', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-gE) :call vm#commands#motion('gE', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-ge) :call vm#commands#motion('ge', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-E) :call vm#commands#motion('E', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-e) :call vm#commands#motion('e', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-B) :call vm#commands#motion('B', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-b) :call vm#commands#motion('b', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-W) :call vm#commands#motion('W', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-w) :call vm#commands#motion('w', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-l) :call vm#commands#motion('l', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-k) :call vm#commands#motion('k', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-j) :call vm#commands#motion('j', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Select-h) :call vm#commands#motion('h', v:count1, 1, 0)
nnoremap <silent> <Plug>(VM-Mouse-Column) :call vm#commands#mouse_column()
nmap <silent> <Plug>(VM-Mouse-Word) <Plug>(VM-Left-Mouse)<Plug>(VM-Find-Under)
nmap <silent> <Plug>(VM-Mouse-Cursor) <Plug>(VM-Left-Mouse)<Plug>(VM-Add-Cursor-At-Pos)
nnoremap <silent> <Plug>(VM-Left-Mouse) <LeftMouse>
xnoremap <silent> <Plug>(VM-Visual-Regex) :call vm#commands#find_by_regex(2):call feedkeys('/', 'n')
nnoremap <silent> <Plug>(VM-Slash-Search) @=vm#commands#find_by_regex(3)
nnoremap <silent> <Plug>(VM-Start-Regex-Search) @=vm#commands#find_by_regex(1)
nnoremap <silent> <Plug>(VM-Find-Under) :call vm#commands#ctrln(v:count1)
xnoremap <silent> <Plug>(VM-Visual-Reduce) :call vm#visual#reduce()
xnoremap <silent> <Plug>(VM-Visual-Add) :call vm#commands#visual_add()
xnoremap <silent> <Plug>(VM-Visual-Cursors) :call vm#commands#visual_cursors()
nnoremap <silent> <Plug>(VM-Select-All) :call vm#commands#find_all(0, 1)
nnoremap <silent> <Plug>(VM-Reselect-Last) :call vm#commands#reselect_last()
nnoremap <silent> <Plug>(VM-Select-Cursor-Up) :call vm#commands#add_cursor_up(1, v:count1)
nnoremap <silent> <Plug>(VM-Select-Cursor-Down) :call vm#commands#add_cursor_down(1, v:count1)
nnoremap <silent> <Plug>(VM-Add-Cursor-Up) :call vm#commands#add_cursor_up(0, v:count1)
nnoremap <silent> <Plug>(VM-Add-Cursor-Down) :call vm#commands#add_cursor_down(0, v:count1)
nnoremap <silent> <Plug>(VM-Add-Cursor-At-Word) :call vm#commands#add_cursor_at_word(1, 1)
nnoremap <silent> <Plug>(VM-Add-Cursor-At-Pos) :call vm#commands#add_cursor_at_pos(0)
xmap <silent> <expr> <Plug>(VM-Visual-Find) vm#operators#find(1, 1)
nnoremap <Plug>CtrlSFQuickfixPrompt :CtrlSFQuickfix 
nnoremap <Plug>CtrlSFPrompt :CtrlSF 
nnoremap <silent> <Plug>(table-mode-sort) :call tablemode#spreadsheet#Sort('')
nnoremap <silent> <Plug>(table-mode-echo-cell) :call tablemode#spreadsheet#EchoCell()
nnoremap <silent> <Plug>(table-mode-eval-formula) :call tablemode#spreadsheet#formula#EvaluateFormulaLine()
nnoremap <silent> <Plug>(table-mode-add-formula) :call tablemode#spreadsheet#formula#Add()
nnoremap <silent> <Plug>(table-mode-insert-column-after) :call tablemode#spreadsheet#InsertColumn(1)
nnoremap <silent> <Plug>(table-mode-insert-column-before) :call tablemode#spreadsheet#InsertColumn(0)
nnoremap <silent> <Plug>(table-mode-delete-column) :call tablemode#spreadsheet#DeleteColumn()
nnoremap <silent> <Plug>(table-mode-delete-row) :call tablemode#spreadsheet#DeleteRow()
xnoremap <silent> <Plug>(table-mode-cell-text-object-i) :call tablemode#spreadsheet#cell#TextObject(1)
xnoremap <silent> <Plug>(table-mode-cell-text-object-a) :call tablemode#spreadsheet#cell#TextObject(0)
onoremap <silent> <Plug>(table-mode-cell-text-object-i) :call tablemode#spreadsheet#cell#TextObject(1)
onoremap <silent> <Plug>(table-mode-cell-text-object-a) :call tablemode#spreadsheet#cell#TextObject(0)
nnoremap <silent> <Plug>(table-mode-motion-right) :call tablemode#spreadsheet#cell#Motion('l')
nnoremap <silent> <Plug>(table-mode-motion-left) :call tablemode#spreadsheet#cell#Motion('h')
nnoremap <silent> <Plug>(table-mode-motion-down) :call tablemode#spreadsheet#cell#Motion('j')
nnoremap <silent> <Plug>(table-mode-motion-up) :call tablemode#spreadsheet#cell#Motion('k')
nnoremap <silent> <Plug>(table-mode-realign) :call tablemode#table#Realign('.')
xnoremap <silent> <Plug>(table-mode-tableize-delimiter) :call tablemode#TableizeByDelimiter()
xnoremap <silent> <Plug>(table-mode-tableize) :Tableize
nnoremap <silent> <Plug>(table-mode-tableize) :Tableize
nnoremap <silent> <Plug>SurroundRepeat .
nnoremap <silent> <expr> <Plug>OSCYank OSCYankOperator('')
map <silent> <Plug>(easymotion-prefix)N <Plug>(easymotion-N)
map <silent> <Plug>(easymotion-prefix)n <Plug>(easymotion-n)
map <silent> <Plug>(easymotion-prefix)k <Plug>(easymotion-k)
map <silent> <Plug>(easymotion-prefix)j <Plug>(easymotion-j)
map <silent> <Plug>(easymotion-prefix)gE <Plug>(easymotion-gE)
map <silent> <Plug>(easymotion-prefix)ge <Plug>(easymotion-ge)
map <silent> <Plug>(easymotion-prefix)E <Plug>(easymotion-E)
map <silent> <Plug>(easymotion-prefix)e <Plug>(easymotion-e)
map <silent> <Plug>(easymotion-prefix)B <Plug>(easymotion-B)
map <silent> <Plug>(easymotion-prefix)b <Plug>(easymotion-b)
map <silent> <Plug>(easymotion-prefix)W <Plug>(easymotion-W)
map <silent> <Plug>(easymotion-prefix)w <Plug>(easymotion-w)
map <silent> <Plug>(easymotion-prefix)T <Plug>(easymotion-T)
map <silent> <Plug>(easymotion-prefix)t <Plug>(easymotion-t)
map <silent> <Plug>(easymotion-prefix)s <Plug>(easymotion-s)
map <silent> <Plug>(easymotion-prefix)F <Plug>(easymotion-F)
map <silent> <Plug>(easymotion-prefix)f <Plug>(easymotion-f)
xnoremap <silent> <Plug>(easymotion-activate) :call EasyMotion#activate(1)
nnoremap <silent> <Plug>(easymotion-activate) :call EasyMotion#activate(0)
snoremap <silent> <Plug>(easymotion-activate) :call EasyMotion#activate(0)
onoremap <silent> <Plug>(easymotion-activate) :call EasyMotion#activate(0)
noremap <silent> <Plug>(easymotion-dotrepeat) :call EasyMotion#DotRepeat()
xnoremap <silent> <Plug>(easymotion-repeat) :call EasyMotion#Repeat(1)
nnoremap <silent> <Plug>(easymotion-repeat) :call EasyMotion#Repeat(0)
snoremap <silent> <Plug>(easymotion-repeat) :call EasyMotion#Repeat(0)
onoremap <silent> <Plug>(easymotion-repeat) :call EasyMotion#Repeat(0)
xnoremap <silent> <Plug>(easymotion-prev) :call EasyMotion#NextPrevious(1,1)
nnoremap <silent> <Plug>(easymotion-prev) :call EasyMotion#NextPrevious(0,1)
snoremap <silent> <Plug>(easymotion-prev) :call EasyMotion#NextPrevious(0,1)
onoremap <silent> <Plug>(easymotion-prev) :call EasyMotion#NextPrevious(0,1)
xnoremap <silent> <Plug>(easymotion-next) :call EasyMotion#NextPrevious(1,0)
nnoremap <silent> <Plug>(easymotion-next) :call EasyMotion#NextPrevious(0,0)
snoremap <silent> <Plug>(easymotion-next) :call EasyMotion#NextPrevious(0,0)
onoremap <silent> <Plug>(easymotion-next) :call EasyMotion#NextPrevious(0,0)
xnoremap <silent> <Plug>(easymotion-wl) :call EasyMotion#WBL(1,0)
nnoremap <silent> <Plug>(easymotion-wl) :call EasyMotion#WBL(0,0)
snoremap <silent> <Plug>(easymotion-wl) :call EasyMotion#WBL(0,0)
onoremap <silent> <Plug>(easymotion-wl) :call EasyMotion#WBL(0,0)
xnoremap <silent> <Plug>(easymotion-lineforward) :call EasyMotion#LineAnywhere(1,0)
nnoremap <silent> <Plug>(easymotion-lineforward) :call EasyMotion#LineAnywhere(0,0)
snoremap <silent> <Plug>(easymotion-lineforward) :call EasyMotion#LineAnywhere(0,0)
onoremap <silent> <Plug>(easymotion-lineforward) :call EasyMotion#LineAnywhere(0,0)
xnoremap <silent> <Plug>(easymotion-lineanywhere) :call EasyMotion#LineAnywhere(1,2)
nnoremap <silent> <Plug>(easymotion-lineanywhere) :call EasyMotion#LineAnywhere(0,2)
snoremap <silent> <Plug>(easymotion-lineanywhere) :call EasyMotion#LineAnywhere(0,2)
onoremap <silent> <Plug>(easymotion-lineanywhere) :call EasyMotion#LineAnywhere(0,2)
xnoremap <silent> <Plug>(easymotion-bd-wl) :call EasyMotion#WBL(1,2)
nnoremap <silent> <Plug>(easymotion-bd-wl) :call EasyMotion#WBL(0,2)
snoremap <silent> <Plug>(easymotion-bd-wl) :call EasyMotion#WBL(0,2)
onoremap <silent> <Plug>(easymotion-bd-wl) :call EasyMotion#WBL(0,2)
xnoremap <silent> <Plug>(easymotion-linebackward) :call EasyMotion#LineAnywhere(1,1)
nnoremap <silent> <Plug>(easymotion-linebackward) :call EasyMotion#LineAnywhere(0,1)
snoremap <silent> <Plug>(easymotion-linebackward) :call EasyMotion#LineAnywhere(0,1)
onoremap <silent> <Plug>(easymotion-linebackward) :call EasyMotion#LineAnywhere(0,1)
xnoremap <silent> <Plug>(easymotion-bl) :call EasyMotion#WBL(1,1)
nnoremap <silent> <Plug>(easymotion-bl) :call EasyMotion#WBL(0,1)
snoremap <silent> <Plug>(easymotion-bl) :call EasyMotion#WBL(0,1)
onoremap <silent> <Plug>(easymotion-bl) :call EasyMotion#WBL(0,1)
xnoremap <silent> <Plug>(easymotion-el) :call EasyMotion#EL(1,0)
nnoremap <silent> <Plug>(easymotion-el) :call EasyMotion#EL(0,0)
snoremap <silent> <Plug>(easymotion-el) :call EasyMotion#EL(0,0)
onoremap <silent> <Plug>(easymotion-el) :call EasyMotion#EL(0,0)
xnoremap <silent> <Plug>(easymotion-gel) :call EasyMotion#EL(1,1)
nnoremap <silent> <Plug>(easymotion-gel) :call EasyMotion#EL(0,1)
snoremap <silent> <Plug>(easymotion-gel) :call EasyMotion#EL(0,1)
onoremap <silent> <Plug>(easymotion-gel) :call EasyMotion#EL(0,1)
xnoremap <silent> <Plug>(easymotion-bd-el) :call EasyMotion#EL(1,2)
nnoremap <silent> <Plug>(easymotion-bd-el) :call EasyMotion#EL(0,2)
snoremap <silent> <Plug>(easymotion-bd-el) :call EasyMotion#EL(0,2)
onoremap <silent> <Plug>(easymotion-bd-el) :call EasyMotion#EL(0,2)
xnoremap <silent> <Plug>(easymotion-jumptoanywhere) :call EasyMotion#JumpToAnywhere(1,2)
nnoremap <silent> <Plug>(easymotion-jumptoanywhere) :call EasyMotion#JumpToAnywhere(0,2)
snoremap <silent> <Plug>(easymotion-jumptoanywhere) :call EasyMotion#JumpToAnywhere(0,2)
onoremap <silent> <Plug>(easymotion-jumptoanywhere) :call EasyMotion#JumpToAnywhere(0,2)
xnoremap <silent> <Plug>(easymotion-vim-n) :call EasyMotion#Search(1,0,1)
nnoremap <silent> <Plug>(easymotion-vim-n) :call EasyMotion#Search(0,0,1)
snoremap <silent> <Plug>(easymotion-vim-n) :call EasyMotion#Search(0,0,1)
onoremap <silent> <Plug>(easymotion-vim-n) :call EasyMotion#Search(0,0,1)
xnoremap <silent> <Plug>(easymotion-n) :call EasyMotion#Search(1,0,0)
nnoremap <silent> <Plug>(easymotion-n) :call EasyMotion#Search(0,0,0)
snoremap <silent> <Plug>(easymotion-n) :call EasyMotion#Search(0,0,0)
onoremap <silent> <Plug>(easymotion-n) :call EasyMotion#Search(0,0,0)
xnoremap <silent> <Plug>(easymotion-bd-n) :call EasyMotion#Search(1,2,0)
nnoremap <silent> <Plug>(easymotion-bd-n) :call EasyMotion#Search(0,2,0)
snoremap <silent> <Plug>(easymotion-bd-n) :call EasyMotion#Search(0,2,0)
onoremap <silent> <Plug>(easymotion-bd-n) :call EasyMotion#Search(0,2,0)
xnoremap <silent> <Plug>(easymotion-vim-N) :call EasyMotion#Search(1,1,1)
nnoremap <silent> <Plug>(easymotion-vim-N) :call EasyMotion#Search(0,1,1)
snoremap <silent> <Plug>(easymotion-vim-N) :call EasyMotion#Search(0,1,1)
onoremap <silent> <Plug>(easymotion-vim-N) :call EasyMotion#Search(0,1,1)
xnoremap <silent> <Plug>(easymotion-N) :call EasyMotion#Search(1,1,0)
nnoremap <silent> <Plug>(easymotion-N) :call EasyMotion#Search(0,1,0)
snoremap <silent> <Plug>(easymotion-N) :call EasyMotion#Search(0,1,0)
onoremap <silent> <Plug>(easymotion-N) :call EasyMotion#Search(0,1,0)
xnoremap <silent> <Plug>(easymotion-eol-j) :call EasyMotion#Eol(1,0)
nnoremap <silent> <Plug>(easymotion-eol-j) :call EasyMotion#Eol(0,0)
snoremap <silent> <Plug>(easymotion-eol-j) :call EasyMotion#Eol(0,0)
onoremap <silent> <Plug>(easymotion-eol-j) :call EasyMotion#Eol(0,0)
xnoremap <silent> <Plug>(easymotion-sol-k) :call EasyMotion#Sol(1,1)
nnoremap <silent> <Plug>(easymotion-sol-k) :call EasyMotion#Sol(0,1)
snoremap <silent> <Plug>(easymotion-sol-k) :call EasyMotion#Sol(0,1)
onoremap <silent> <Plug>(easymotion-sol-k) :call EasyMotion#Sol(0,1)
xnoremap <silent> <Plug>(easymotion-sol-j) :call EasyMotion#Sol(1,0)
nnoremap <silent> <Plug>(easymotion-sol-j) :call EasyMotion#Sol(0,0)
snoremap <silent> <Plug>(easymotion-sol-j) :call EasyMotion#Sol(0,0)
onoremap <silent> <Plug>(easymotion-sol-j) :call EasyMotion#Sol(0,0)
xnoremap <silent> <Plug>(easymotion-k) :call EasyMotion#JK(1,1)
nnoremap <silent> <Plug>(easymotion-k) :call EasyMotion#JK(0,1)
snoremap <silent> <Plug>(easymotion-k) :call EasyMotion#JK(0,1)
onoremap <silent> <Plug>(easymotion-k) :call EasyMotion#JK(0,1)
xnoremap <silent> <Plug>(easymotion-j) :call EasyMotion#JK(1,0)
nnoremap <silent> <Plug>(easymotion-j) :call EasyMotion#JK(0,0)
snoremap <silent> <Plug>(easymotion-j) :call EasyMotion#JK(0,0)
onoremap <silent> <Plug>(easymotion-j) :call EasyMotion#JK(0,0)
xnoremap <silent> <Plug>(easymotion-bd-jk) :call EasyMotion#JK(1,2)
nnoremap <silent> <Plug>(easymotion-bd-jk) :call EasyMotion#JK(0,2)
snoremap <silent> <Plug>(easymotion-bd-jk) :call EasyMotion#JK(0,2)
onoremap <silent> <Plug>(easymotion-bd-jk) :call EasyMotion#JK(0,2)
xnoremap <silent> <Plug>(easymotion-eol-bd-jk) :call EasyMotion#Eol(1,2)
nnoremap <silent> <Plug>(easymotion-eol-bd-jk) :call EasyMotion#Eol(0,2)
snoremap <silent> <Plug>(easymotion-eol-bd-jk) :call EasyMotion#Eol(0,2)
onoremap <silent> <Plug>(easymotion-eol-bd-jk) :call EasyMotion#Eol(0,2)
xnoremap <silent> <Plug>(easymotion-sol-bd-jk) :call EasyMotion#Sol(1,2)
nnoremap <silent> <Plug>(easymotion-sol-bd-jk) :call EasyMotion#Sol(0,2)
snoremap <silent> <Plug>(easymotion-sol-bd-jk) :call EasyMotion#Sol(0,2)
onoremap <silent> <Plug>(easymotion-sol-bd-jk) :call EasyMotion#Sol(0,2)
xnoremap <silent> <Plug>(easymotion-eol-k) :call EasyMotion#Eol(1,1)
nnoremap <silent> <Plug>(easymotion-eol-k) :call EasyMotion#Eol(0,1)
snoremap <silent> <Plug>(easymotion-eol-k) :call EasyMotion#Eol(0,1)
onoremap <silent> <Plug>(easymotion-eol-k) :call EasyMotion#Eol(0,1)
xnoremap <silent> <Plug>(easymotion-iskeyword-ge) :call EasyMotion#EK(1,1)
nnoremap <silent> <Plug>(easymotion-iskeyword-ge) :call EasyMotion#EK(0,1)
snoremap <silent> <Plug>(easymotion-iskeyword-ge) :call EasyMotion#EK(0,1)
onoremap <silent> <Plug>(easymotion-iskeyword-ge) :call EasyMotion#EK(0,1)
xnoremap <silent> <Plug>(easymotion-w) :call EasyMotion#WB(1,0)
nnoremap <silent> <Plug>(easymotion-w) :call EasyMotion#WB(0,0)
snoremap <silent> <Plug>(easymotion-w) :call EasyMotion#WB(0,0)
onoremap <silent> <Plug>(easymotion-w) :call EasyMotion#WB(0,0)
xnoremap <silent> <Plug>(easymotion-bd-W) :call EasyMotion#WBW(1,2)
nnoremap <silent> <Plug>(easymotion-bd-W) :call EasyMotion#WBW(0,2)
snoremap <silent> <Plug>(easymotion-bd-W) :call EasyMotion#WBW(0,2)
onoremap <silent> <Plug>(easymotion-bd-W) :call EasyMotion#WBW(0,2)
xnoremap <silent> <Plug>(easymotion-iskeyword-w) :call EasyMotion#WBK(1,0)
nnoremap <silent> <Plug>(easymotion-iskeyword-w) :call EasyMotion#WBK(0,0)
snoremap <silent> <Plug>(easymotion-iskeyword-w) :call EasyMotion#WBK(0,0)
onoremap <silent> <Plug>(easymotion-iskeyword-w) :call EasyMotion#WBK(0,0)
xnoremap <silent> <Plug>(easymotion-gE) :call EasyMotion#EW(1,1)
nnoremap <silent> <Plug>(easymotion-gE) :call EasyMotion#EW(0,1)
snoremap <silent> <Plug>(easymotion-gE) :call EasyMotion#EW(0,1)
onoremap <silent> <Plug>(easymotion-gE) :call EasyMotion#EW(0,1)
xnoremap <silent> <Plug>(easymotion-e) :call EasyMotion#E(1,0)
nnoremap <silent> <Plug>(easymotion-e) :call EasyMotion#E(0,0)
snoremap <silent> <Plug>(easymotion-e) :call EasyMotion#E(0,0)
onoremap <silent> <Plug>(easymotion-e) :call EasyMotion#E(0,0)
xnoremap <silent> <Plug>(easymotion-bd-E) :call EasyMotion#EW(1,2)
nnoremap <silent> <Plug>(easymotion-bd-E) :call EasyMotion#EW(0,2)
snoremap <silent> <Plug>(easymotion-bd-E) :call EasyMotion#EW(0,2)
onoremap <silent> <Plug>(easymotion-bd-E) :call EasyMotion#EW(0,2)
xnoremap <silent> <Plug>(easymotion-iskeyword-e) :call EasyMotion#EK(1,0)
nnoremap <silent> <Plug>(easymotion-iskeyword-e) :call EasyMotion#EK(0,0)
snoremap <silent> <Plug>(easymotion-iskeyword-e) :call EasyMotion#EK(0,0)
onoremap <silent> <Plug>(easymotion-iskeyword-e) :call EasyMotion#EK(0,0)
xnoremap <silent> <Plug>(easymotion-b) :call EasyMotion#WB(1,1)
nnoremap <silent> <Plug>(easymotion-b) :call EasyMotion#WB(0,1)
snoremap <silent> <Plug>(easymotion-b) :call EasyMotion#WB(0,1)
onoremap <silent> <Plug>(easymotion-b) :call EasyMotion#WB(0,1)
xnoremap <silent> <Plug>(easymotion-iskeyword-b) :call EasyMotion#WBK(1,1)
nnoremap <silent> <Plug>(easymotion-iskeyword-b) :call EasyMotion#WBK(0,1)
snoremap <silent> <Plug>(easymotion-iskeyword-b) :call EasyMotion#WBK(0,1)
onoremap <silent> <Plug>(easymotion-iskeyword-b) :call EasyMotion#WBK(0,1)
xnoremap <silent> <Plug>(easymotion-iskeyword-bd-w) :call EasyMotion#WBK(1,2)
nnoremap <silent> <Plug>(easymotion-iskeyword-bd-w) :call EasyMotion#WBK(0,2)
snoremap <silent> <Plug>(easymotion-iskeyword-bd-w) :call EasyMotion#WBK(0,2)
onoremap <silent> <Plug>(easymotion-iskeyword-bd-w) :call EasyMotion#WBK(0,2)
xnoremap <silent> <Plug>(easymotion-W) :call EasyMotion#WBW(1,0)
nnoremap <silent> <Plug>(easymotion-W) :call EasyMotion#WBW(0,0)
snoremap <silent> <Plug>(easymotion-W) :call EasyMotion#WBW(0,0)
onoremap <silent> <Plug>(easymotion-W) :call EasyMotion#WBW(0,0)
xnoremap <silent> <Plug>(easymotion-bd-w) :call EasyMotion#WB(1,2)
nnoremap <silent> <Plug>(easymotion-bd-w) :call EasyMotion#WB(0,2)
snoremap <silent> <Plug>(easymotion-bd-w) :call EasyMotion#WB(0,2)
onoremap <silent> <Plug>(easymotion-bd-w) :call EasyMotion#WB(0,2)
xnoremap <silent> <Plug>(easymotion-iskeyword-bd-e) :call EasyMotion#EK(1,2)
nnoremap <silent> <Plug>(easymotion-iskeyword-bd-e) :call EasyMotion#EK(0,2)
snoremap <silent> <Plug>(easymotion-iskeyword-bd-e) :call EasyMotion#EK(0,2)
onoremap <silent> <Plug>(easymotion-iskeyword-bd-e) :call EasyMotion#EK(0,2)
xnoremap <silent> <Plug>(easymotion-ge) :call EasyMotion#E(1,1)
nnoremap <silent> <Plug>(easymotion-ge) :call EasyMotion#E(0,1)
snoremap <silent> <Plug>(easymotion-ge) :call EasyMotion#E(0,1)
onoremap <silent> <Plug>(easymotion-ge) :call EasyMotion#E(0,1)
xnoremap <silent> <Plug>(easymotion-E) :call EasyMotion#EW(1,0)
nnoremap <silent> <Plug>(easymotion-E) :call EasyMotion#EW(0,0)
snoremap <silent> <Plug>(easymotion-E) :call EasyMotion#EW(0,0)
onoremap <silent> <Plug>(easymotion-E) :call EasyMotion#EW(0,0)
xnoremap <silent> <Plug>(easymotion-bd-e) :call EasyMotion#E(1,2)
nnoremap <silent> <Plug>(easymotion-bd-e) :call EasyMotion#E(0,2)
snoremap <silent> <Plug>(easymotion-bd-e) :call EasyMotion#E(0,2)
onoremap <silent> <Plug>(easymotion-bd-e) :call EasyMotion#E(0,2)
xnoremap <silent> <Plug>(easymotion-B) :call EasyMotion#WBW(1,1)
nnoremap <silent> <Plug>(easymotion-B) :call EasyMotion#WBW(0,1)
snoremap <silent> <Plug>(easymotion-B) :call EasyMotion#WBW(0,1)
onoremap <silent> <Plug>(easymotion-B) :call EasyMotion#WBW(0,1)
nnoremap <silent> <Plug>(easymotion-overwin-w) :call EasyMotion#overwin#w()
nnoremap <silent> <Plug>(easymotion-overwin-line) :call EasyMotion#overwin#line()
nnoremap <silent> <Plug>(easymotion-overwin-f2) :call EasyMotion#OverwinF(2)
nnoremap <silent> <Plug>(easymotion-overwin-f) :call EasyMotion#OverwinF(1)
xnoremap <silent> <Plug>(easymotion-Tln) :call EasyMotion#TL(-1,1,1)
nnoremap <silent> <Plug>(easymotion-Tln) :call EasyMotion#TL(-1,0,1)
snoremap <silent> <Plug>(easymotion-Tln) :call EasyMotion#TL(-1,0,1)
onoremap <silent> <Plug>(easymotion-Tln) :call EasyMotion#TL(-1,0,1)
xnoremap <silent> <Plug>(easymotion-t2) :call EasyMotion#T(2,1,0)
nnoremap <silent> <Plug>(easymotion-t2) :call EasyMotion#T(2,0,0)
snoremap <silent> <Plug>(easymotion-t2) :call EasyMotion#T(2,0,0)
onoremap <silent> <Plug>(easymotion-t2) :call EasyMotion#T(2,0,0)
xnoremap <silent> <Plug>(easymotion-t) :call EasyMotion#T(1,1,0)
nnoremap <silent> <Plug>(easymotion-t) :call EasyMotion#T(1,0,0)
snoremap <silent> <Plug>(easymotion-t) :call EasyMotion#T(1,0,0)
onoremap <silent> <Plug>(easymotion-t) :call EasyMotion#T(1,0,0)
xnoremap <silent> <Plug>(easymotion-s) :call EasyMotion#S(1,1,2)
nnoremap <silent> <Plug>(easymotion-s) :call EasyMotion#S(1,0,2)
snoremap <silent> <Plug>(easymotion-s) :call EasyMotion#S(1,0,2)
onoremap <silent> <Plug>(easymotion-s) :call EasyMotion#S(1,0,2)
xnoremap <silent> <Plug>(easymotion-tn) :call EasyMotion#T(-1,1,0)
nnoremap <silent> <Plug>(easymotion-tn) :call EasyMotion#T(-1,0,0)
snoremap <silent> <Plug>(easymotion-tn) :call EasyMotion#T(-1,0,0)
onoremap <silent> <Plug>(easymotion-tn) :call EasyMotion#T(-1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-t2) :call EasyMotion#T(2,1,2)
nnoremap <silent> <Plug>(easymotion-bd-t2) :call EasyMotion#T(2,0,2)
snoremap <silent> <Plug>(easymotion-bd-t2) :call EasyMotion#T(2,0,2)
onoremap <silent> <Plug>(easymotion-bd-t2) :call EasyMotion#T(2,0,2)
xnoremap <silent> <Plug>(easymotion-tl) :call EasyMotion#TL(1,1,0)
nnoremap <silent> <Plug>(easymotion-tl) :call EasyMotion#TL(1,0,0)
snoremap <silent> <Plug>(easymotion-tl) :call EasyMotion#TL(1,0,0)
onoremap <silent> <Plug>(easymotion-tl) :call EasyMotion#TL(1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-tn) :call EasyMotion#T(-1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-tn) :call EasyMotion#T(-1,0,2)
snoremap <silent> <Plug>(easymotion-bd-tn) :call EasyMotion#T(-1,0,2)
onoremap <silent> <Plug>(easymotion-bd-tn) :call EasyMotion#T(-1,0,2)
xnoremap <silent> <Plug>(easymotion-fn) :call EasyMotion#S(-1,1,0)
nnoremap <silent> <Plug>(easymotion-fn) :call EasyMotion#S(-1,0,0)
snoremap <silent> <Plug>(easymotion-fn) :call EasyMotion#S(-1,0,0)
onoremap <silent> <Plug>(easymotion-fn) :call EasyMotion#S(-1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-tl) :call EasyMotion#TL(1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-tl) :call EasyMotion#TL(1,0,2)
snoremap <silent> <Plug>(easymotion-bd-tl) :call EasyMotion#TL(1,0,2)
onoremap <silent> <Plug>(easymotion-bd-tl) :call EasyMotion#TL(1,0,2)
xnoremap <silent> <Plug>(easymotion-fl) :call EasyMotion#SL(1,1,0)
nnoremap <silent> <Plug>(easymotion-fl) :call EasyMotion#SL(1,0,0)
snoremap <silent> <Plug>(easymotion-fl) :call EasyMotion#SL(1,0,0)
onoremap <silent> <Plug>(easymotion-fl) :call EasyMotion#SL(1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-tl2) :call EasyMotion#TL(2,1,2)
nnoremap <silent> <Plug>(easymotion-bd-tl2) :call EasyMotion#TL(2,0,2)
snoremap <silent> <Plug>(easymotion-bd-tl2) :call EasyMotion#TL(2,0,2)
onoremap <silent> <Plug>(easymotion-bd-tl2) :call EasyMotion#TL(2,0,2)
xnoremap <silent> <Plug>(easymotion-bd-fn) :call EasyMotion#S(-1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-fn) :call EasyMotion#S(-1,0,2)
snoremap <silent> <Plug>(easymotion-bd-fn) :call EasyMotion#S(-1,0,2)
onoremap <silent> <Plug>(easymotion-bd-fn) :call EasyMotion#S(-1,0,2)
xnoremap <silent> <Plug>(easymotion-f) :call EasyMotion#S(1,1,0)
nnoremap <silent> <Plug>(easymotion-f) :call EasyMotion#S(1,0,0)
snoremap <silent> <Plug>(easymotion-f) :call EasyMotion#S(1,0,0)
onoremap <silent> <Plug>(easymotion-f) :call EasyMotion#S(1,0,0)
xnoremap <silent> <Plug>(easymotion-bd-fl) :call EasyMotion#SL(1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-fl) :call EasyMotion#SL(1,0,2)
snoremap <silent> <Plug>(easymotion-bd-fl) :call EasyMotion#SL(1,0,2)
onoremap <silent> <Plug>(easymotion-bd-fl) :call EasyMotion#SL(1,0,2)
xnoremap <silent> <Plug>(easymotion-Fl2) :call EasyMotion#SL(2,1,1)
nnoremap <silent> <Plug>(easymotion-Fl2) :call EasyMotion#SL(2,0,1)
snoremap <silent> <Plug>(easymotion-Fl2) :call EasyMotion#SL(2,0,1)
onoremap <silent> <Plug>(easymotion-Fl2) :call EasyMotion#SL(2,0,1)
xnoremap <silent> <Plug>(easymotion-tl2) :call EasyMotion#TL(2,1,0)
nnoremap <silent> <Plug>(easymotion-tl2) :call EasyMotion#TL(2,0,0)
snoremap <silent> <Plug>(easymotion-tl2) :call EasyMotion#TL(2,0,0)
onoremap <silent> <Plug>(easymotion-tl2) :call EasyMotion#TL(2,0,0)
xnoremap <silent> <Plug>(easymotion-f2) :call EasyMotion#S(2,1,0)
nnoremap <silent> <Plug>(easymotion-f2) :call EasyMotion#S(2,0,0)
snoremap <silent> <Plug>(easymotion-f2) :call EasyMotion#S(2,0,0)
onoremap <silent> <Plug>(easymotion-f2) :call EasyMotion#S(2,0,0)
xnoremap <silent> <Plug>(easymotion-Fln) :call EasyMotion#SL(-1,1,1)
nnoremap <silent> <Plug>(easymotion-Fln) :call EasyMotion#SL(-1,0,1)
snoremap <silent> <Plug>(easymotion-Fln) :call EasyMotion#SL(-1,0,1)
onoremap <silent> <Plug>(easymotion-Fln) :call EasyMotion#SL(-1,0,1)
xnoremap <silent> <Plug>(easymotion-sln) :call EasyMotion#SL(-1,1,2)
nnoremap <silent> <Plug>(easymotion-sln) :call EasyMotion#SL(-1,0,2)
snoremap <silent> <Plug>(easymotion-sln) :call EasyMotion#SL(-1,0,2)
onoremap <silent> <Plug>(easymotion-sln) :call EasyMotion#SL(-1,0,2)
xnoremap <silent> <Plug>(easymotion-tln) :call EasyMotion#TL(-1,1,0)
nnoremap <silent> <Plug>(easymotion-tln) :call EasyMotion#TL(-1,0,0)
snoremap <silent> <Plug>(easymotion-tln) :call EasyMotion#TL(-1,0,0)
onoremap <silent> <Plug>(easymotion-tln) :call EasyMotion#TL(-1,0,0)
xnoremap <silent> <Plug>(easymotion-fl2) :call EasyMotion#SL(2,1,0)
nnoremap <silent> <Plug>(easymotion-fl2) :call EasyMotion#SL(2,0,0)
snoremap <silent> <Plug>(easymotion-fl2) :call EasyMotion#SL(2,0,0)
onoremap <silent> <Plug>(easymotion-fl2) :call EasyMotion#SL(2,0,0)
xnoremap <silent> <Plug>(easymotion-bd-fl2) :call EasyMotion#SL(2,1,2)
nnoremap <silent> <Plug>(easymotion-bd-fl2) :call EasyMotion#SL(2,0,2)
snoremap <silent> <Plug>(easymotion-bd-fl2) :call EasyMotion#SL(2,0,2)
onoremap <silent> <Plug>(easymotion-bd-fl2) :call EasyMotion#SL(2,0,2)
xnoremap <silent> <Plug>(easymotion-T2) :call EasyMotion#T(2,1,1)
nnoremap <silent> <Plug>(easymotion-T2) :call EasyMotion#T(2,0,1)
snoremap <silent> <Plug>(easymotion-T2) :call EasyMotion#T(2,0,1)
onoremap <silent> <Plug>(easymotion-T2) :call EasyMotion#T(2,0,1)
xnoremap <silent> <Plug>(easymotion-bd-tln) :call EasyMotion#TL(-1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-tln) :call EasyMotion#TL(-1,0,2)
snoremap <silent> <Plug>(easymotion-bd-tln) :call EasyMotion#TL(-1,0,2)
onoremap <silent> <Plug>(easymotion-bd-tln) :call EasyMotion#TL(-1,0,2)
xnoremap <silent> <Plug>(easymotion-T) :call EasyMotion#T(1,1,1)
nnoremap <silent> <Plug>(easymotion-T) :call EasyMotion#T(1,0,1)
snoremap <silent> <Plug>(easymotion-T) :call EasyMotion#T(1,0,1)
onoremap <silent> <Plug>(easymotion-T) :call EasyMotion#T(1,0,1)
xnoremap <silent> <Plug>(easymotion-bd-t) :call EasyMotion#T(1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-t) :call EasyMotion#T(1,0,2)
snoremap <silent> <Plug>(easymotion-bd-t) :call EasyMotion#T(1,0,2)
onoremap <silent> <Plug>(easymotion-bd-t) :call EasyMotion#T(1,0,2)
xnoremap <silent> <Plug>(easymotion-Tn) :call EasyMotion#T(-1,1,1)
nnoremap <silent> <Plug>(easymotion-Tn) :call EasyMotion#T(-1,0,1)
snoremap <silent> <Plug>(easymotion-Tn) :call EasyMotion#T(-1,0,1)
onoremap <silent> <Plug>(easymotion-Tn) :call EasyMotion#T(-1,0,1)
xnoremap <silent> <Plug>(easymotion-s2) :call EasyMotion#S(2,1,2)
nnoremap <silent> <Plug>(easymotion-s2) :call EasyMotion#S(2,0,2)
snoremap <silent> <Plug>(easymotion-s2) :call EasyMotion#S(2,0,2)
onoremap <silent> <Plug>(easymotion-s2) :call EasyMotion#S(2,0,2)
xnoremap <silent> <Plug>(easymotion-Tl) :call EasyMotion#TL(1,1,1)
nnoremap <silent> <Plug>(easymotion-Tl) :call EasyMotion#TL(1,0,1)
snoremap <silent> <Plug>(easymotion-Tl) :call EasyMotion#TL(1,0,1)
onoremap <silent> <Plug>(easymotion-Tl) :call EasyMotion#TL(1,0,1)
xnoremap <silent> <Plug>(easymotion-sn) :call EasyMotion#S(-1,1,2)
nnoremap <silent> <Plug>(easymotion-sn) :call EasyMotion#S(-1,0,2)
snoremap <silent> <Plug>(easymotion-sn) :call EasyMotion#S(-1,0,2)
onoremap <silent> <Plug>(easymotion-sn) :call EasyMotion#S(-1,0,2)
xnoremap <silent> <Plug>(easymotion-Fn) :call EasyMotion#S(-1,1,1)
nnoremap <silent> <Plug>(easymotion-Fn) :call EasyMotion#S(-1,0,1)
snoremap <silent> <Plug>(easymotion-Fn) :call EasyMotion#S(-1,0,1)
onoremap <silent> <Plug>(easymotion-Fn) :call EasyMotion#S(-1,0,1)
xnoremap <silent> <Plug>(easymotion-sl) :call EasyMotion#SL(1,1,2)
nnoremap <silent> <Plug>(easymotion-sl) :call EasyMotion#SL(1,0,2)
snoremap <silent> <Plug>(easymotion-sl) :call EasyMotion#SL(1,0,2)
onoremap <silent> <Plug>(easymotion-sl) :call EasyMotion#SL(1,0,2)
xnoremap <silent> <Plug>(easymotion-Fl) :call EasyMotion#SL(1,1,1)
nnoremap <silent> <Plug>(easymotion-Fl) :call EasyMotion#SL(1,0,1)
snoremap <silent> <Plug>(easymotion-Fl) :call EasyMotion#SL(1,0,1)
onoremap <silent> <Plug>(easymotion-Fl) :call EasyMotion#SL(1,0,1)
xnoremap <silent> <Plug>(easymotion-sl2) :call EasyMotion#SL(2,1,2)
nnoremap <silent> <Plug>(easymotion-sl2) :call EasyMotion#SL(2,0,2)
snoremap <silent> <Plug>(easymotion-sl2) :call EasyMotion#SL(2,0,2)
onoremap <silent> <Plug>(easymotion-sl2) :call EasyMotion#SL(2,0,2)
xnoremap <silent> <Plug>(easymotion-bd-fln) :call EasyMotion#SL(-1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-fln) :call EasyMotion#SL(-1,0,2)
snoremap <silent> <Plug>(easymotion-bd-fln) :call EasyMotion#SL(-1,0,2)
onoremap <silent> <Plug>(easymotion-bd-fln) :call EasyMotion#SL(-1,0,2)
xnoremap <silent> <Plug>(easymotion-F) :call EasyMotion#S(1,1,1)
nnoremap <silent> <Plug>(easymotion-F) :call EasyMotion#S(1,0,1)
snoremap <silent> <Plug>(easymotion-F) :call EasyMotion#S(1,0,1)
onoremap <silent> <Plug>(easymotion-F) :call EasyMotion#S(1,0,1)
xnoremap <silent> <Plug>(easymotion-bd-f) :call EasyMotion#S(1,1,2)
nnoremap <silent> <Plug>(easymotion-bd-f) :call EasyMotion#S(1,0,2)
snoremap <silent> <Plug>(easymotion-bd-f) :call EasyMotion#S(1,0,2)
onoremap <silent> <Plug>(easymotion-bd-f) :call EasyMotion#S(1,0,2)
xnoremap <silent> <Plug>(easymotion-F2) :call EasyMotion#S(2,1,1)
nnoremap <silent> <Plug>(easymotion-F2) :call EasyMotion#S(2,0,1)
snoremap <silent> <Plug>(easymotion-F2) :call EasyMotion#S(2,0,1)
onoremap <silent> <Plug>(easymotion-F2) :call EasyMotion#S(2,0,1)
xnoremap <silent> <Plug>(easymotion-bd-f2) :call EasyMotion#S(2,1,2)
nnoremap <silent> <Plug>(easymotion-bd-f2) :call EasyMotion#S(2,0,2)
snoremap <silent> <Plug>(easymotion-bd-f2) :call EasyMotion#S(2,0,2)
onoremap <silent> <Plug>(easymotion-bd-f2) :call EasyMotion#S(2,0,2)
xnoremap <silent> <Plug>(easymotion-Tl2) :call EasyMotion#TL(2,1,1)
nnoremap <silent> <Plug>(easymotion-Tl2) :call EasyMotion#TL(2,0,1)
snoremap <silent> <Plug>(easymotion-Tl2) :call EasyMotion#TL(2,0,1)
onoremap <silent> <Plug>(easymotion-Tl2) :call EasyMotion#TL(2,0,1)
xnoremap <silent> <Plug>(easymotion-fln) :call EasyMotion#SL(-1,1,0)
nnoremap <silent> <Plug>(easymotion-fln) :call EasyMotion#SL(-1,0,0)
snoremap <silent> <Plug>(easymotion-fln) :call EasyMotion#SL(-1,0,0)
onoremap <silent> <Plug>(easymotion-fln) :call EasyMotion#SL(-1,0,0)
nmap <silent> <Plug>CommentaryUndo :echoerr "Change your <Plug>CommentaryUndo map to <Plug>Commentary<Plug>Commentary"
nnoremap <silent> <Plug>unimpairedTPNext :exe "p".(v:count ? v:count : "")."tnext"
nnoremap <silent> <Plug>unimpairedTPPrevious :exe "p".(v:count ? v:count : "")."tprevious"
nnoremap <silent> <Plug>(unimpaired-ptnext) :exe v:count1 . "ptnext"
nnoremap <silent> <Plug>(unimpaired-ptprevious) :exe v:count1 . "ptprevious"
nnoremap <silent> <Plug>unimpairedTLast :exe "".(v:count ? v:count : "")."tlast"
nnoremap <silent> <Plug>unimpairedTFirst :exe "".(v:count ? v:count : "")."tfirst"
nnoremap <silent> <Plug>unimpairedTNext :exe "".(v:count ? v:count : "")."tnext"
nnoremap <silent> <Plug>unimpairedTPrevious :exe "".(v:count ? v:count : "")."tprevious"
nnoremap <silent> <Plug>(unimpaired-tlast) :exe "".(v:count ? v:count : "")."tlast"
nnoremap <silent> <Plug>(unimpaired-tfirst) :exe "".(v:count ? v:count : "")."tfirst"
nnoremap <silent> <Plug>(unimpaired-tnext) :exe "".(v:count ? v:count : "")."tnext"
nnoremap <silent> <Plug>(unimpaired-tprevious) :exe "".(v:count ? v:count : "")."tprevious"
nnoremap <silent> <Plug>unimpairedQNFile :exe "".(v:count ? v:count : "")."cnfile"zv
nnoremap <silent> <Plug>unimpairedQPFile :exe "".(v:count ? v:count : "")."cpfile"zv
nnoremap <silent> <Plug>(unimpaired-cnfile) :exe "".(v:count ? v:count : "")."cnfile"zv
nnoremap <silent> <Plug>(unimpaired-cpfile) :exe "".(v:count ? v:count : "")."cpfile"zv
nnoremap <silent> <Plug>unimpairedQLast :exe "".(v:count ? v:count : "")."clast"zv
nnoremap <silent> <Plug>unimpairedQFirst :exe "".(v:count ? v:count : "")."cfirst"zv
nnoremap <silent> <Plug>unimpairedQNext :exe "".(v:count ? v:count : "")."cnext"zv
nnoremap <silent> <Plug>unimpairedQPrevious :exe "".(v:count ? v:count : "")."cprevious"zv
nnoremap <silent> <Plug>(unimpaired-clast) :exe "".(v:count ? v:count : "")."clast"zv
nnoremap <silent> <Plug>(unimpaired-cfirst) :exe "".(v:count ? v:count : "")."cfirst"zv
nnoremap <silent> <Plug>(unimpaired-cnext) :exe "".(v:count ? v:count : "")."cnext"zv
nnoremap <silent> <Plug>(unimpaired-cprevious) :exe "".(v:count ? v:count : "")."cprevious"zv
nnoremap <silent> <Plug>unimpairedLNFile :exe "".(v:count ? v:count : "")."lnfile"zv
nnoremap <silent> <Plug>unimpairedLPFile :exe "".(v:count ? v:count : "")."lpfile"zv
nnoremap <silent> <Plug>(unimpaired-lnfile) :exe "".(v:count ? v:count : "")."lnfile"zv
nnoremap <silent> <Plug>(unimpaired-lpfile) :exe "".(v:count ? v:count : "")."lpfile"zv
nnoremap <silent> <Plug>unimpairedLLast :exe "".(v:count ? v:count : "")."llast"zv
nnoremap <silent> <Plug>unimpairedLFirst :exe "".(v:count ? v:count : "")."lfirst"zv
nnoremap <silent> <Plug>unimpairedLNext :exe "".(v:count ? v:count : "")."lnext"zv
nnoremap <silent> <Plug>unimpairedLPrevious :exe "".(v:count ? v:count : "")."lprevious"zv
nnoremap <silent> <Plug>(unimpaired-llast) :exe "".(v:count ? v:count : "")."llast"zv
nnoremap <silent> <Plug>(unimpaired-lfirst) :exe "".(v:count ? v:count : "")."lfirst"zv
nnoremap <silent> <Plug>(unimpaired-lnext) :exe "".(v:count ? v:count : "")."lnext"zv
nnoremap <silent> <Plug>(unimpaired-lprevious) :exe "".(v:count ? v:count : "")."lprevious"zv
nnoremap <silent> <Plug>unimpairedBLast :exe "".(v:count ? v:count : "")."blast"
nnoremap <silent> <Plug>unimpairedBFirst :exe "".(v:count ? v:count : "")."bfirst"
nnoremap <silent> <Plug>unimpairedBNext :exe "".(v:count ? v:count : "")."bnext"
nnoremap <silent> <Plug>unimpairedBPrevious :exe "".(v:count ? v:count : "")."bprevious"
nnoremap <silent> <Plug>(unimpaired-blast) :exe "".(v:count ? v:count : "")."blast"
nnoremap <silent> <Plug>(unimpaired-bfirst) :exe "".(v:count ? v:count : "")."bfirst"
nnoremap <silent> <Plug>(unimpaired-bnext) :exe "".(v:count ? v:count : "")."bnext"
nnoremap <silent> <Plug>(unimpaired-bprevious) :exe "".(v:count ? v:count : "")."bprevious"
nnoremap <silent> <Plug>unimpairedALast :exe "".(v:count ? v:count : "")."last"
nnoremap <silent> <Plug>unimpairedAFirst :exe "".(v:count ? v:count : "")."first"
nnoremap <silent> <Plug>unimpairedANext :exe "".(v:count ? v:count : "")."next"
nnoremap <silent> <Plug>unimpairedAPrevious :exe "".(v:count ? v:count : "")."previous"
nnoremap <silent> <Plug>(unimpaired-last) :exe "".(v:count ? v:count : "")."last"
nnoremap <silent> <Plug>(unimpaired-first) :exe "".(v:count ? v:count : "")."first"
nnoremap <silent> <Plug>(unimpaired-next) :exe "".(v:count ? v:count : "")."next"
nnoremap <silent> <Plug>(unimpaired-previous) :exe "".(v:count ? v:count : "")."previous"
nmap <silent> <2-LeftMouse> <Plug>(matchup-double-click)
nnoremap <Plug>(matchup-reload) :MatchupReload
nnoremap <silent> <Plug>(matchup-double-click) :call matchup#text_obj#double_click()
onoremap <silent> <Plug>(matchup-a%) :call matchup#text_obj#delimited(0, 0, 'delim_all')
onoremap <silent> <Plug>(matchup-i%) :call matchup#text_obj#delimited(1, 0, 'delim_all')
xnoremap <silent> <Plug>(matchup-a%) :call matchup#text_obj#delimited(0, 1, 'delim_all')
xnoremap <silent> <Plug>(matchup-i%) :call matchup#text_obj#delimited(1, 1, 'delim_all')
onoremap <silent> <Plug>(matchup-Z%) :call matchup#motion#op('Z%')
xnoremap <silent> <SNR>153_(matchup-Z%) :call matchup#motion#jump_inside_prev(1)
nnoremap <silent> <Plug>(matchup-Z%) :call matchup#motion#jump_inside_prev(0)
onoremap <silent> <Plug>(matchup-z%) :call matchup#motion#op('z%')
xnoremap <silent> <SNR>153_(matchup-z%) :call matchup#motion#jump_inside(1)
nnoremap <silent> <Plug>(matchup-z%) :call matchup#motion#jump_inside(0)
onoremap <silent> <Plug>(matchup-[%) :call matchup#motion#op('[%')
onoremap <silent> <Plug>(matchup-]%) :call matchup#motion#op(']%')
xnoremap <silent> <SNR>153_(matchup-[%) :call matchup#motion#find_unmatched(1, 0)
xnoremap <silent> <SNR>153_(matchup-]%) :call matchup#motion#find_unmatched(1, 1)
nnoremap <silent> <Plug>(matchup-[%) :call matchup#motion#find_unmatched(0, 0)
nnoremap <silent> <Plug>(matchup-]%) :call matchup#motion#find_unmatched(0, 1)
onoremap <silent> <Plug>(matchup-g%) :call matchup#motion#op('g%')
xnoremap <silent> <SNR>153_(matchup-g%) :call matchup#motion#find_matching_pair(1, 0)
onoremap <silent> <Plug>(matchup-%) :call matchup#motion#op('%')
xnoremap <silent> <SNR>153_(matchup-%) :call matchup#motion#find_matching_pair(1, 1)
nnoremap <silent> <Plug>(matchup-g%) :call matchup#motion#find_matching_pair(0, 0)
nnoremap <silent> <Plug>(matchup-%) :call matchup#motion#find_matching_pair(0, 1)
nnoremap <silent> <expr> <SNR>153_(wise) empty(g:v_motion_force) ? 'v' : g:v_motion_force
nnoremap <silent> <Plug>(matchup-hi-surround) :call matchup#matchparen#highlight_surrounding()
nnoremap <silent> <Plug>(startify-open-buffers) :call startify#open_buffers()
onoremap <silent> <Plug>(fzf-maps-o) :call fzf#vim#maps('o', 0)
xnoremap <silent> <Plug>(fzf-maps-x) :call fzf#vim#maps('x', 0)
nnoremap <silent> <Plug>(fzf-maps-n) :call fzf#vim#maps('n', 0)
tnoremap <silent> <Plug>(fzf-normal) 
tnoremap <silent> <Plug>(fzf-insert) i
nnoremap <silent> <Plug>(fzf-normal) <Nop>
nnoremap <silent> <Plug>(fzf-insert) i
nnoremap <expr> <Plug>(DBExeLine) db#op_exec() . '_'
nnoremap <expr> <Plug>(DBExe) db#op_exec()
xnoremap <expr> <Plug>(DBExe) db#op_exec()
nnoremap <nowait> <silent> <C-C>p :CocPrev
nnoremap <nowait> <silent> <C-C>n :CocNext
nnoremap <nowait> <silent> <C-C>y :CocList -A --normal yank
nnoremap <nowait> <silent> <C-C>s :CocList -I symbols
nnoremap <nowait> <silent> <C-C>o :CocList outline
nnoremap <nowait> <silent> <M-c> :CocList commands
nnoremap <nowait> <silent> <C-C>c :CocList commands
nnoremap <nowait> <silent> <C-C>e :CocList extensions
nnoremap <nowait> <silent> <C-C>d :CocList diagnostics
nnoremap <nowait> <silent> <C-C>l :CocList
nmap <C-C>ac <Plug>(coc-codeaction)
xmap <silent> <C-C>r <Plug>(coc-range-select)
nnoremap <nowait> <silent> <C-C>r :CocListResume
nmap <C-C>a <Plug>(coc-codeaction-selected)
xmap <C-C>a <Plug>(coc-codeaction-selected)
nmap <C-C>f <Plug>(coc-format-selected)
xmap <C-C>f <Plug>(coc-format-selected)
nnoremap <C-S>t :CtrlSFToggle
nnoremap <C-S>o :CtrlSFOpen
nmap <C-S>p <Plug>CtrlSFPwordPath
nmap <C-S>n <Plug>CtrlSFCwordPath
vmap <C-S>F <Plug>CtrlSFVwordExec
vmap <C-S>f <Plug>CtrlSFVwordPath
nmap <C-S>f <Plug>CtrlSFPrompt
nnoremap <silent> <F8> :call hl#async_task('project-run')
nnoremap <silent> <F7> :call hl#async_task('project-build')
nnoremap <silent> <F6> :call hl#async_task('project-build-run')
nnoremap <silent> <F2> :call hl#async_task('file-build-run')
nnoremap <F10> :call asyncrun#quickfix_toggle(10)
omap <C-X><C-M> <Plug>(fzf-maps-o)
xmap <C-X><C-M> <Plug>(fzf-maps-x)
nmap <C-X><C-M> <Plug>(fzf-maps-n)
nnoremap <silent> <C-B> :Buffers
nnoremap <silent> <C-H> :History
nnoremap <silent> <C-F> :Files
nnoremap <silent> <C-L> :FloatermNew lf
tnoremap <silent> <F3> :FloatermToggle
nnoremap <silent> <F3> :FloatermToggle
nnoremap <F12> :MaximizerToggle!
nnoremap <silent> <F1> :Fern . -drawer -reveal=% -toggle -width=50
vnoremap <C-K> :m'<-2gv
vnoremap <C-J> :m'>+gv
nnoremap <C-K> :m-2
nnoremap <C-J> :m+
nnoremap <silent> <expr> <C-CR> "o\"
nnoremap <silent> <S-F2> :call hl#sync_task()
vnoremap <silent> <C-S> :update
nnoremap <silent> <C-S> :update
nnoremap <C-G> :call EchoPath()
nnoremap <silent> <BS> :noh
nnoremap <silent> <C-Tab> :tabnew
nnoremap <silent> <C-Q> :x
nmap <F5> :e!
tnoremap <silent> <M-=> :FloatermToggle
nnoremap <silent> <M-=> :FloatermToggle
vnoremap <silent> <D-t> :call hl#quickui#show_translate(hl#visual_selection())
nnoremap <silent> <D-t> :call hl#quickui#show_translate(expand("<cword>"))
vnoremap <silent> <D-d> :call hl#quickui#show_dict(hl#visual_selection())
nnoremap <silent> <D-d> :call hl#quickui#show_dict(expand("<cword>"))
nnoremap <silent> <M-.> :AsyncStop
noremap <silent> <D-.> :AsyncStop
noremap <silent> <D-b> :call hl#async_task('project-build')
noremap <silent> <D-r> :call hl#async_task('file-build-run')
vmap <D-/> gc
nmap <D-/> gcc
nnoremap <M-m> :FM
tnoremap <silent> <M-t> ‚¶ø
nnoremap <silent> <M-t> :Tags
nnoremap <silent> <M-x> :Commands
nnoremap <M-,> m`A,``
nnoremap <M-;> m`A;``
nnoremap <silent> <M-q> :call hl#close_all()
nnoremap <expr> <M-B> hl#move_any_char_to_left()
nnoremap <silent> <M-j> :call hl#preview_scroll('j')
nnoremap <silent> <M-k> :call hl#preview_scroll('k')
nnoremap <silent> <M-d> :call hl#preview_scroll('d')
nnoremap <silent> <M-u> :call hl#preview_scroll('u')
tnoremap <M-b> <C-Left>
tnoremap <M-f> <C-Right>
nnoremap <silent> <M-L> l
nnoremap <silent> <M-K> k
nnoremap <silent> <M-J> j
nnoremap <silent> <M-H> h
noremap <silent> <D-u> :TestFile
noremap <silent> <D-0> :tabn 10
noremap <silent> <D-9> :tabn 9
noremap <silent> <D-8> :tabn 8
noremap <silent> <D-7> :tabn 7
noremap <silent> <D-6> :tabn 6
noremap <silent> <D-5> :tabn 5
noremap <silent> <D-4> :tabn 4
noremap <silent> <D-3> :tabn 3
noremap <silent> <D-2> :tabn 2
noremap <silent> <D-1> :tabn 1
nnoremap <silent> <M-l> gt
nnoremap <silent> <M-h> gT
cnoremap  <Home>
inoremap  <Home>
cnoremap  <Left>
inoremap  <Left>
cnoremap  <End>
inoremap  <End>
cnoremap  <Right>
inoremap  <Right>
imap S <Plug>ISurround
imap s <Plug>Isurround
imap <silent> % <Plug>(matchup-c_g%)
inoremap t :CtrlSFToggle
inoremap <silent>  :update
imap  <Plug>(fzf-complete-line)
inoremap <expr>  fzf#vim#complete#path('fd')
inoremap <expr>  fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
imap  <Plug>(fzf-maps-i)
cnoremap <expr> %% getcmdtype( ) == ':' ? expand('%:h').'/' : '%%' "%% Ëá™Âä®Êâ©Â±ï‰∏∫ÂΩìÂâçÁõÆÂΩï
tnoremap <silent> ¬Ω :FloatermToggle
nnoremap <silent> ¬Ω :FloatermToggle
nnoremap <silent> ¬Æ :AsyncStop
nnoremap ¬¨ m`A,``
nnoremap ¬ª m`A;``
nnoremap <nowait> <silent> √£ :CocList commands
nnoremap √≠ :FM
tnoremap <silent> √¥ ‚¶ø
nnoremap <silent> √¥ :Tags
nnoremap <silent> √∏ :Commands
nnoremap <silent> √± :call hl#close_all()
nnoremap <expr> √Ç hl#move_any_char_to_left()
nnoremap <silent> √™ :call hl#preview_scroll('j')
nnoremap <silent> √´ :call hl#preview_scroll('k')
nnoremap <silent> √§ :call hl#preview_scroll('d')
nnoremap <silent> √µ :call hl#preview_scroll('u')
tnoremap √¢ <C-Left>
tnoremap √¶ <C-Right>
nnoremap <silent> √å l
nnoremap <silent> √ã k
nnoremap <silent> √ä j
nnoremap <silent> √à h
nnoremap <silent> √¨ gt
nnoremap <silent> √® gT
iabbr serach search
iabbr toekn token
iabbr cofnig config
iabbr isntall install
iabbr udpated updated
iabbr udpates updates
iabbr udpate update
iabbr imprt import
iabbr improt import
let &cpo=s:cpo_save
unlet s:cpo_save
set noarabicshape
set autoindent
set autoread
set autowrite
set background=dark
set backspace=2
set backup
set backupcopy=yes
set backupdir=~/.cache/vim/backup
set backupskip=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe,*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico,*.py[co],*.pkl,*.DS_Store,.*.swp,*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set blurradius=10
set cedit=<C-Y>
set completeopt=longest,menuone,popup
set completepopup=align:menu,border:off,highlight:WildMenu
set confirm
set cscopeprg=gtags-cscope
set cscopequickfix=s+,c+,d+,i+,t+,e+,g+,f+,a+
set dictionary=~/.vim/dict/all.dict
set diffopt=vertical,filler,closeoff,context:3,internal,indent-heuristic,algorithm:histogram
set directory=~/.cache/vim/swp
set expandtab
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set fileformats=unix,mac,dos
set foldopen=block,mark,percent,quickfix,search,tag,undo
set formatlistpat=^\\s*[\\[({]\\?\\([0-9]\\+\\|[a-zA-Z]\\+\\)[\\]:.)}]\\s\\+\\|^\\s*[-‚Äì+o*‚Ä¢]\\s\\+
set grepformat=%f:%l:%c:%m
set grepprg=rg\ --vimgrep\ --no-heading\ --smart-case
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175,a:blinkon0
set guifont=FiraCode\ Nerd\ Font:h16
set guifontwide=Microsoft\ YaHei:h14
set guioptions=gm
set guitablabel=%M%t
set helplang=en
set hidden
set history=10000
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set listchars=tab:‚ñ∏-,eol:‚Ü≤,trail:-,extends:‚ùØ,precedes:‚ùÆ,nbsp:‚ê£,space:‚ãÖ
set macmeta
set macthinstrokes
set matchpairs=(:),{:},[:],<:>,(:),{:},[:],„Äê:„Äë,„Ää:„Äã,„Äà:„Äâ,Ôºª:ÔºΩ,Ôºà:Ôºâ,„Äå:„Äç,„Äé:„Äè,‚Äò:‚Äô,‚Äú:‚Äù
set mouse=a
set mousemodel=popup
set path=.,/usr/include,,,~/repo/lang/c/foundation,~/repo/lang/cpp/foundation,~/repo/lang/objc/foundation,~/repo/lang/python/foundation
set printexpr=system('open\ -a\ Preview\ '.v:fname_in)\ +\ v:shell_error
set pyxversion=3
set runtimepath=
set runtimepath+=~/.vim
set runtimepath+=~/.vim/plugged/fern.vim
set runtimepath+=~/.vim/plugged/fern-hijack.vim
set runtimepath+=~/.vim/plugged/nerdfont.vim
set runtimepath+=~/.vim/plugged/glyph-palette.vim
set runtimepath+=~/.vim/plugged/fern-renderer-nerdfont.vim
set runtimepath+=~/.vim/plugged/fern-git-status.vim
set runtimepath+=~/.vim/plugged/fern-mapping-fzf.vim
set runtimepath+=~/.vim/plugged/fzf
set runtimepath+=~/.vim/plugged/fzf.vim
set runtimepath+=~/.vim/plugged/vim-rooter
set runtimepath+=~/.vim/plugged/vim-floaterm
set runtimepath+=~/.vim/plugged/vim-startify
set runtimepath+=~/.vim/plugged/vim-devicons
set runtimepath+=~/.vim/plugged/onedark.vim
set runtimepath+=~/.vim/plugged/lightline.vim
set runtimepath+=~/.vim/plugged/indentLine
set runtimepath+=~/.vim/plugged/vim-matchup
set runtimepath+=~/.vim/plugged/vim-unimpaired
set runtimepath+=~/.vim/plugged/vim-commentary
set runtimepath+=~/.vim/plugged/vim-fugitive
set runtimepath+=~/.vim/plugged/vim-rhubarb
set runtimepath+=~/.vim/plugged/vim-projectionist
set runtimepath+=~/.vim/plugged/gv.vim
set runtimepath+=~/.vim/plugged/markdown-preview.nvim
set runtimepath+=~/.vim/plugged/vim-preview
set runtimepath+=~/.vim/plugged/vim-maximizer
set runtimepath+=~/.vim/plugged/vim-easymotion
set runtimepath+=~/.vim/plugged/vim-stay
set runtimepath+=~/.vim/plugged/vim-oscyank
set runtimepath+=~/.vim/plugged/vim-startuptime
set runtimepath+=~/.vim/plugged/vim-cpp-enhanced-highlight
set runtimepath+=~/.vim/plugged/vim-ruby
set runtimepath+=~/.vim/plugged/python-syntax
set runtimepath+=~/.vim/plugged/SimpylFold
set runtimepath+=~/.vim/plugged/dart-vim-plugin
set runtimepath+=~/.vim/plugged/vim-applescript
set runtimepath+=~/.vim/plugged/vim-beancount
set runtimepath+=~/.vim/plugged/jsonc.vim
set runtimepath+=~/.vim/plugged/csv.vim
set runtimepath+=~/.vim/plugged/vim-kitty
set runtimepath+=~/.vim/plugged/chezmoi.vim
set runtimepath+=~/.vim/plugged/plantuml-syntax
set runtimepath+=~/.vim/plugged/vim-test
set runtimepath+=~/.vim/plugged/kotlin-vim
set runtimepath+=~/.vim/plugged/vim-toml
set runtimepath+=~/repo/vim/vim-alternate
set runtimepath+=~/repo/vim/vim-gitignore
set runtimepath+=~/repo/vim/vim-markdown
set runtimepath+=~/.vim/plugged/vim-signature
set runtimepath+=~/.vim/plugged/auto-pairs
set runtimepath+=~/.vim/plugged/vim-repeat
set runtimepath+=~/.vim/plugged/vim-surround
set runtimepath+=~/.vim/plugged/vim-eunuch
set runtimepath+=~/.vim/plugged/vim-dadbod
set runtimepath+=~/.vim/plugged/vim-dadbod-ui
set runtimepath+=~/.vim/plugged/vim-exchange
set runtimepath+=~/.vim/plugged/vim-textobj-user
set runtimepath+=~/.vim/plugged/vim-textobj-indent
set runtimepath+=~/.vim/plugged/vim-textobj-fold
set runtimepath+=~/.vim/plugged/vim-textobj-line
set runtimepath+=~/.vim/plugged/vim-textobj-syntax
set runtimepath+=~/.vim/plugged/vim-textobj-entire
set runtimepath+=~/.vim/plugged/targets.vim
set runtimepath+=~/.vim/plugged/tabular
set runtimepath+=~/.vim/plugged/xkbswitch
set runtimepath+=~/.vim/plugged/vim-table-mode
set runtimepath+=~/.vim/plugged/ctrlsf.vim
set runtimepath+=~/.vim/plugged/vim-visual-multi
set runtimepath+=~/.vim/plugged/vim-gitgutter
set runtimepath+=~/.vim/plugged/vim-togglecursor
set runtimepath+=~/.vim/plugged/vim-mundo
set runtimepath+=~/.vim/plugged/vista.vim
set runtimepath+=~/.vim/plugged/inline_edit.vim
set runtimepath+=~/.vim/plugged/vim-autoformat
set runtimepath+=~/.vim/plugged/asyncrun.vim
set runtimepath+=~/.vim/plugged/asynctasks.vim
set runtimepath+=~/.vim/plugged/vim-quickui
set runtimepath+=~/repo/vim/vim-renamer
set runtimepath+=~/repo/vim/vim-t2s
set runtimepath+=~/.vim/plugged/bracey.vim
set runtimepath+=~/.vim/plugged/emmet-vim
set runtimepath+=~/.vim/plugged/vim-qf
set runtimepath+=~/.vim/plugged/FastFold
set runtimepath+=~/.vim/plugged/coc.nvim
set runtimepath+=~/.vim/plugged/vim-dict
set runtimepath+=~/.vim/plugged/vim-gutentags
set runtimepath+=~/.vim/plugged/gutentags_plus
set runtimepath+=~/.vim/plugged/vimspector
set runtimepath+=~/.vim/plugged/vim-scriptease
set runtimepath+=~/.vim/plugged/vim-repl
set runtimepath+=~/.vim/plugged/dash.vim
set runtimepath+=~/.vim/plugged/open-browser.vim
set runtimepath+=~/.vim/plugged/plantuml-previewer.vim
set runtimepath+=~/.vim/plugged/vim-themis
set runtimepath+=~/.vim/plugged/christmas.vim
set runtimepath+=~/repo/vim/vim-taskpaper
set runtimepath+=/Applications/MacVim.app/Contents/Resources/vim/vimfiles
set runtimepath+=/Applications/MacVim.app/Contents/Resources/vim/runtime
set runtimepath+=/Applications/MacVim.app/Contents/Resources/vim/vimfiles/after
set runtimepath+=~/.vim/plugged/indentLine/after
set runtimepath+=~/.vim/plugged/vim-matchup/after
set runtimepath+=~/.vim/plugged/vim-cpp-enhanced-highlight/after
set runtimepath+=~/.vim/plugged/chezmoi.vim/after
set runtimepath+=~/repo/vim/vim-markdown/after
set runtimepath+=~/.vim/plugged/vim-signature/after
set runtimepath+=~/.vim/plugged/tabular/after
set runtimepath+=~/.vim/plugged/ctrlsf.vim/after
set runtimepath+=~/.vim/plugged/vim-qf/after
set runtimepath+=~/.vim/after
set runtimepath+=~/.config/coc/extensions/node_modules/coc-snippets
set scrolloff=5
set shell=zsh
set shiftwidth=4
set shortmess=filnxtToOI
set showbreak=‚Ü™
set showcmd
set showmatch
set noshowmode
set smartcase
set smartindent
set smarttab
set spelllang=en,cjk
set spellsuggest=best,9
set splitbelow
set splitright
set nostartofline
set switchbuf=usetab,newtab
set synmaxcol=200
set tabline=%!lightline#tabline()
set tabpagemax=100
set tabstop=4
set tags=./.tags;,./tags;,.tags,tags
set termencoding=utf-8
set termguicolors
set textwidth=150
set ttimeout
set ttimeoutlen=10
set undodir=~/.cache/vim/undo
set undofile
set updatetime=50
set viewoptions=folds,options,cursor,curdir,slash,unix
set viminfo='1000,f1,<500,:1000,@1000,/1000,h,r/private/tmp,s10,n~/.vim/.viminfo
set virtualedit=block
set visualbell
set wildignore=*.o,*.obj,*.dylib,*.bin,*.dll,*.exe,*/.git/*,*/.svn/*,*/__pycache__/*,*/build/**,*.jpg,*.png,*.jpeg,*.bmp,*.gif,*.tiff,*.svg,*.ico,*.py[co],*.pkl,*.DS_Store,.*.swp,*.aux,*.bbl,*.blg,*.brf,*.fls,*.fdb_latexmk,*.synctex.gz,*.xdv
set wildignorecase
set wildmenu
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/al/module/AKFaceRecognizer
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
argglobal
%argdel
$argadd AKFaceRecognizer.podspec
edit AKFaceRecognizer.podspec
argglobal
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <M-N> :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> <M-P> AutoPairsToggle()
inoremap <buffer> <silent> <M-F> =AutoPairsFastWrap()
inoremap <buffer> <silent> <C-H> =AutoPairsDelete()
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
inoremap <buffer> <silent> <M-'> =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> <M-"> =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> <M-}> =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> <M-{> =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> <M-]> =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> <M-[> =AutoPairsMoveCharacter('[')
inoremap <buffer> <silent> <M-)> =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> <M-(> =AutoPairsMoveCharacter('(')
cmap <buffer> <C-R><C-F> <Plug><cfile>
cmap <buffer> <SNR>264_<ctag> <Plug><ctag>
cmap <buffer> <SNR>264_<cfile> <Plug><cfile>
inoremap <buffer> <silent> ¬ß =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¬¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> ¬© =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¬® =AutoPairsMoveCharacter('(')
inoremap <buffer> <silent> √é :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> √ê AutoPairsToggle()
inoremap <buffer> <silent> √Ü =AutoPairsFastWrap()
inoremap <buffer> <silent> √Ω =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> √ª =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> √ù =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> √õ =AutoPairsMoveCharacter('[')
noremap <buffer> <silent> <M-N> :call AutoPairsJump()
noremap <buffer> <silent> <M-P> :call AutoPairsToggle()
inoremap <buffer> <silent>  =AutoPairsDelete()
cmap <buffer>  <Plug><cfile>
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> √é :call AutoPairsJump()
noremap <buffer> <silent> √ê :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),0],:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=+1
setlocal colorcolumn=+1
setlocal comments=b:#
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=inc
setlocal conceallevel=1
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal cursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal cursorlineopt=both
setlocal define=
setlocal dictionary=~/.vim/dict/all.dict,~/.vim/plugged/vim-dict/dict/ruby.dict
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal fixendofline
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
set foldlevel=3
setlocal foldlevel=3
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
set foldnestmax=10
setlocal foldnestmax=10
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*[\\[({]\\?\\([0-9]\\+\\|[a-zA-Z]\\+\\)[\\]:.)}]\\s\\+\\|^\\s*[-‚Äì+o*‚Ä¢]\\s\\+
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=^\\s*\\<\\(load\\>\\|require\\>\\|autoload\\s*:\\=[\"']\\=\\h\\w*[\"']\\=,\\)
setlocal includeexpr=
setlocal indentexpr=GetRubyIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,:,.,=end,=else,=elsif,=when,=in\ ,=ensure,=rescue,==begin,==end,=private,=protected,=public
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri\ -T\ -f\ bs
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal listchars=
setlocal macmeta
setlocal makeencoding=
setlocal makeprg=
setlocal matchpairs=(:),{:},[:],<:>,(:),{:},[:],„Äê:„Äë,„Ää:„Äã,„Äà:„Äâ,Ôºª:ÔºΩ,Ôºà:Ôºâ,„Äå:„Äç,„Äé:„Äè,‚Äò:‚Äô,‚Äú:‚Äù
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=.,/usr/include,,,~/repo/lang/c/foundation,~/repo/lang/cpp/foundation,~/repo/lang/objc/foundation,~/repo/lang/python/foundation,/opt/homebrew/Cellar/rbenv/1.2.0/rbenv.d/exec/gem-rehash,~/.rbenv/versions/3.0.2/lib/ruby/site_ruby/3.0.0,~/.rbenv/versions/3.0.2/lib/ruby/site_ruby/3.0.0/arm64-darwin21,~/.rbenv/versions/3.0.2/lib/ruby/site_ruby,~/.rbenv/versions/3.0.2/lib/ruby/vendor_ruby/3.0.0,~/.rbenv/versions/3.0.2/lib/ruby/vendor_ruby/3.0.0/arm64-darwin21,~/.rbenv/versions/3.0.2/lib/ruby/vendor_ruby,~/.rbenv/versions/3.0.2/lib/ruby/3.0.0,~/.rbenv/versions/3.0.2/lib/ruby/3.0.0/arm64-darwin21
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
set relativenumber
setlocal relativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal scrollbind
setlocal scrolloff=-1
setlocal shiftwidth=2
setlocal noshortname
setlocal showbreak=
setlocal sidescrolloff=-1
set signcolumn=yes
setlocal signcolumn=yes
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en,cjk
setlocal spelloptions=
setlocal statusline=%{lightline#link()}%#LightlineLeft_active_0#%(\ %{hl#lightline#LightlineMode()}\ %)%{hl#lightline#LightlineMode()!=#\"\"&&((&paste))?\"|\":\"\"}%(\ %{&paste?\"PASTE\":\"\"}\ %)%#LightlineLeft_active_0_1#%#LightlineLeft_active_1#%(\ %{hl#lightline#LightlineFugitive()}\ %)%{hl#lightline#LightlineFugitive()!=#\"\"&&(hl#lightline#LightlineReadonly()!=#\"\"||hl#lightline#FileNameWithIcon()!=#\"\"||(&modified||!&modifiable))?\"|\":\"\"}%(\ %{hl#lightline#LightlineReadonly()}\ %)%{hl#lightline#LightlineReadonly()!=#\"\"&&(hl#lightline#FileNameWithIcon()!=#\"\"||(&modified||!&modifiable))?\"|\":\"\"}%(\ %{hl#lightline#FileNameWithIcon()}\ %)%{hl#lightline#FileNameWithIcon()!=#\"\"&&((&modified||!&modifiable))?\"|\":\"\"}%(\ %M\ %)%#LightlineLeft_active_1_2#%#LightlineLeft_active_2#%(\ %{hl#lightline#BuffersCount()}\ %)%{hl#lightline#BuffersCount()!=#\"\"&&(hl#lightline#CocDiagnosticStatus1()!=#\"\"||gutentags#statusline()!=#\"\"||hl#lightline#GitDiffCount()!=#\"\")?\"|\":\"\"}%(\ %{hl#lightline#CocDiagnosticStatus1()}\ %)%{hl#lightline#CocDiagnosticStatus1()!=#\"\"&&(gutentags#statusline()!=#\"\"||hl#lightline#GitDiffCount()!=#\"\")?\"|\":\"\"}%(\ %{gutentags#statusline()}\ %)%{gutentags#statusline()!=#\"\"&&(hl#lightline#GitDiffCount()!=#\"\")?\"|\":\"\"}%(\ %{hl#lightline#GitDiffCount()}\ %)%#LightlineLeft_active_2_3#%#LightlineMiddle_active#%=%#LightlineRight_active_2_3#%#LightlineRight_active_2#%(\ %{&ff}\ %)%{1||1?\"|\":\"\"}%(\ %{&fenc!=#\"\"?&fenc:&enc}\ %)%{1?\"|\":\"\"}%(\ %{&ft!=#\"\"?&ft:\"no\ ft\"}\ %)%#LightlineRight_active_1_2#%#LightlineRight_active_1#%(\ %3p%%\ %)%#LightlineRight_active_0_1#%#LightlineRight_active_0#%(\ ÓÇ°\ %3l:%-2v\ %)
setlocal suffixesadd=.rb
setlocal swapfile
setlocal synmaxcol=200
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=4
setlocal tagcase=
setlocal tagfunc=
setlocal tags=~/.cache/tags/Users-hanley-al-module-AKFaceRecognizer-.tags,./.tags;,./tags;,.tags,tags,/opt/homebrew/Cellar/rbenv/1.2.0/rbenv.d/exec/gem-rehash/tags,~/.rbenv/versions/3.0.2/lib/ruby/site_ruby/3.0.0/tags,~/.rbenv/versions/3.0.2/lib/ruby/site_ruby/3.0.0/arm64-darwin21/tags,~/.rbenv/versions/3.0.2/lib/ruby/site_ruby/tags,~/.rbenv/versions/3.0.2/lib/ruby/vendor_ruby/3.0.0/tags,~/.rbenv/versions/3.0.2/lib/ruby/vendor_ruby/3.0.0/arm64-darwin21/tags,~/.rbenv/versions/3.0.2/lib/ruby/vendor_ruby/tags,~/.rbenv/versions/3.0.2/lib/ruby/3.0.0/tags,~/.rbenv/versions/3.0.2/lib/ruby/3.0.0/arm64-darwin21/tags
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=150
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal virtualedit=
setlocal wincolor=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let &fdl = &fdl
let s:l = 4 - ((3 * winheight(0) + 20) / 40)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 025|
tabnext 1
badd +0 AKFaceRecognizer.podspec
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToOI
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
