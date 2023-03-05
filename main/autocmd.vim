" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

"███████████████████████  autocmd  ██████████████████████████

" Enter{{{
augroup Enter
    autocmd!
    au VimEnter * call Enter()
augroup END
"}}}

augroup BufEnter1
    autocmd!
    if hl#plug_loaded('nerdtree')
        " Exit Vim if NERDTree is the only window remaining in the only tab.
        autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
        " Close the tab if NERDTree is the only window remaining in it.
        autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
    endif
augroup END

" augroup BufEnter2
"     autocmd!
"     if hl#plug_loaded('fern.vim')
"         autocmd BufEnter * if &ft ==? 'fern' | call hl#fern#highlight_cusorline() | endif
"     endif
" augroup END

" augroup BufLeave1
"     if hl#plug_loaded('fern.vim')
"         autocmd BufLeave * if &ft ==? 'fern' | call hl#fern#put_back_cusorline() | endif
"     endif
" augroup END

augroup ReadPost1
    autocmd!
    au BufWinEnter * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g`\"" | endif "自动跳转到上次退出的位置
augroup END

" augroup SetDictionary
"     autocmd!
"     au FileType * call hl#TrySetDictionary()
" augroup END

" HLMarker{{{
augroup HLMarker
    autocmd!
    autocmd Syntax * syntax keyword HLNote MARK TODO NOTE CHANGED containedin=.*Comment,vimCommentTitle,cCommentL
    autocmd Syntax * syntax keyword HLWarning FIXME WARNING containedin=.*Comment,vimCommentTitle,cCommentL
    autocmd Syntax * syntax keyword HLError ERROR BUG containedin=.*Comment,vimCommentTitle,cCommentL
    " autocmd Syntax * call matchadd('Debug', '\W\zs\(NOTE\|INFO\|IDEA\)')
    " 这里要使用 matchadd 方法进行自定义词语的高亮, 因为它的优先级较高, 不会被 cursorLine 的背景色覆盖, 且所有文件类型都起作用
    " autocmd Syntax * syntax keyword NoteMarker NOTE TODO MARK containedin=.*Comment,vimCommentTitle,cCommentL
    " autocmd Syntax * call matchadd('Todo',  '\W\zs\(TODO\|FIXME\|XXX\|MARK\|CHANGED\|NOTE\|WARNING\|BUG\)')
    " autocmd Syntax * call matchadd('Error',  '\W\zs\(TODO\|FIXME\|XXX\|MARK\|CHANGED\|NOTE\|WARNING\|BUG\)')
augroup end
"}}}

augroup ColorSchemeSet
    autocmd!
    autocmd ColorScheme * call HLColorScheme()
augroup END

" Autosave & Load Views.
augroup AutoSaveRestoreView
    autocmd!
    " autocmd BufWritePost,BufLeave,WinLeave,VimLeave ?* if hl#util#ShouldMakeView() | mkview | endif
    " autocmd BufWinEnter ?* if hl#util#ShouldMakeView() | silent loadview | endif
    autocmd BufWritePost ?* if hl#util#ShouldMakeView() | mkview | endif
    autocmd BufReadPost ?* if hl#util#ShouldMakeView() | silent loadview | endif
augroup end

if hl#plug_loaded('onedark.vim')
    augroup OneDarkRevise
        autocmd!
        autocmd ColorScheme * call OneDarkRevise()
    augroup END
endif


if hl#plug_loaded('vim-quickui')
    augroup QuickUIPreview
        autocmd!
        au FileType qf noremap <silent><buffer> p :call quickui#tools#preview_quickfix()<cr>
        " au FileType qf noremap <silent><buffer> U :call quickui#preview#scroll(-20)<cr>
        " au FileType qf noremap <silent><buffer> D :call quickui#preview#scroll(20)<cr>
        " au FileType qf noremap <silent><buffer> K :call quickui#preview#scroll(-1)<cr>
        " au FileType qf noremap <silent><buffer> J :call quickui#preview#scroll(1)<cr>
        " au FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
        " au FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
        " au FileType qf noremap <silent><buffer>  U :PreviewScroll -1<cr>
        " au FileType qf noremap <silent><buffer>  D :PreviewScroll +1<cr>
    augroup END
endif



if hl#plug_loaded('coc.nvim')
    augroup CocAutoGroup
        autocmd!
        " use throttling
        " let s:ThrottleFnTrailing = _#throttle(function('CocActionAsync'), 1000, 0)
        " let s:ThrottleFnLeading = _#throttle(function('CocActionAsync'), 1000)
        " autocmd CursorMoved * silent call s:ThrottleFnTrailing.call('highlight')
        " autocmd CursorMoved * silent call s:ThrottleFnLeading.call('highlight')
        autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
        " autocmd CursorHold * silent call CocActionAsync('highlight')
        " autocmd CursorHold * silent call hl#coc#highlight_current_cursor()
        autocmd CursorMoved * silent call hl#coc#highlight_current_cursor()
        autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
        autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
        autocmd BufNew,BufEnter,BufAdd,BufCreate * call hl#coc#disable_for_type()
        autocmd BufNew,BufEnter,BufAdd,BufCreate * call hl#coc#disable_for_large_file()
        autocmd BufNew,BufEnter,BufAdd,BufCreate * call hl#coc#disable_for_specific_pattern()
    augroup end
endif

if hl#plug_loaded('fern.vim')
    augroup fern-custom
        autocmd!
        autocmd FileType fern call FernInit()
    augroup END
endif

if hl#plug_loaded('fern-git-status.vim')
    augroup my-glyph-palette
        autocmd!
        autocmd FileType fern call glyph_palette#apply()
        autocmd FileType nerdtree,startify call glyph_palette#apply()
    augroup END
endif

if hl#plug_loaded('vim-gutentags')
    augroup MyGutentagsStatusLineRefresher
        autocmd!
        autocmd User GutentagsUpdating call lightline#update()
        autocmd User GutentagsUpdated call lightline#update()
    augroup end
endif

if hl#plug_loaded('emmet-vim')
    augroup EmmetInstall
        autocmd!
        autocmd FileType html,css EmmetInstall
    augroup end
endif

if hl#plug_loaded('fzf.vim')
    augroup FzfStatusLineTheme
        autocmd! User FzfStatusLine call hl#fzf#statusline_theme()
    augroup end
endif

" 保存时自动格式化指定文件类型代码
" au BufWrite * :Autoformat
" autocmd BufWrite *.sql,*.c,*.py,*.java,*.js :Autoformat "设置发生保存事件时执行格式化
" autocmd CmdwinEnter * inoremap <expr><buffer> <TAB>
"             \pumvisible() ? "\<C-n>" : "\<TAB>"
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
" au VimEnter * if argc() == 0 && !has("gui_running") | exec 'silent e.' | endif
" au GUIEnter * exec 'cd $HKMS' | exec 'silent e .'

" " get project root
" function! s:get_root(path, ...)
"     let markers = ['.project', '.git', '.hg', '.svn', '.root']
"     if exists('g:asyncrun_rootmarks')
"         let markers = g:asyncrun_rootmarks
"     endif
"     if a:0 > 0
"         if type(a:1) == type([])
"             let markers = a:1
"         endif
"     endif
"     let strict = (a:0 >= 2)? (a:2) : 0
"     let l:hr = s:find_root(a:path, markers, strict)
"     if s:asyncrun_windows
"         let l:hr = s:StringReplace(l:hr, '/', "\\")
"     endif
"     return l:hr
" endfunc

" " find project root
" function! s:find_root(path, markers, strict)
"     function! s:guess_root(filename, markers)
"         let fullname = Fullname(a:filename)
"         if fullname =~ '^fugitive:/'
"             if exists('b:git_dir')
"                 return fnamemodify(b:git_dir, ':h')
"             endif
"             return '' " skip any fugitive buffers early
"         endif
"         let pivot = fullname
"         if !isdirectory(pivot)
"             let pivot = fnamemodify(pivot, ':h')
"         endif
"         while 1
"             let prev = pivot
"             for marker in a:markers
"                 let newname = s:path_join(pivot, marker)
"                 if newname =~ '[\*\?\[\]]'
"                     if glob(newname) != ''
"                         return pivot
"                     endif
"                 elseif filereadable(newname)
"                     return pivot
"                 elseif isdirectory(newname)
"                     return pivot
"                 endif
"             endfor
"             let pivot = fnamemodify(pivot, ':h')
"             if pivot == prev
"                 break
"             endif
"         endwhile
"         return ''
"     endfunc
"     if a:path == '%'
"         if exists('b:asyncrun_root') && b:asyncrun_root != ''
"             return b:asyncrun_root
"         elseif exists('t:asyncrun_root') && t:asyncrun_root != ''
"             return t:asyncrun_root
"         elseif exists('g:asyncrun_root') && g:asyncrun_root != ''
"             return g:asyncrun_root
"         endif
"     endif
"     let root = s:guess_root(a:path, a:markers)
"     if root != ''
"         return Fullname(root)
"     elseif a:strict != 0
"         return ''
"     endif
"     " Not found: return parent directory of current file / file itself.
"     let fullname = Fullname(a:path)
"     if isdirectory(fullname)
"         return fullname
"     endif
"     return Fullname(fnamemodify(fullname, ':h'))
" endfunc

" " change directory with right command
" function! s:chdir(path)
"     if has('nvim')
"         let cmd = haslocaldir()? 'lcd' : (haslocaldir(-1, 0)? 'tcd' : 'cd')
"     else
"         let cmd = haslocaldir()? ((haslocaldir() == 1)? 'lcd' : 'tcd') : 'cd'
"     endif
"     silent execute cmd . ' '. fnameescape(a:path)
" endfunc

" " full file name
" function! Fullname(f)
"     let f = a:f
"     if f =~ "'."
"         try
"             redir => m
"             silent exe ':marks' f[1]
"             redir END
"             let f = split(split(m, '\n')[-1])[-1]
"             let f = filereadable(f)? f : ''
"         catch
"             let f = '%'
"         endtry
"     endif
"     if f == '%'
"         let f = expand('%')
"         if &bt == 'terminal'
"             let f = ''
"         endif
"     endif
"     let f = fnamemodify(f, ':p')
"     if s:asyncrun_windows
"         let f = substitute(f, "\\", '/', 'g')
"     endif
"     if len(f) > 1
"         let size = len(f)
"         if f[size - 1] == '/'
"             let f = strpart(f, 0, size - 1)
"         endif
"     endif
"     return f
" endfunc
