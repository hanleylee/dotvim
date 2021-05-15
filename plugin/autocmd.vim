"███████████████████████  autocmd  ██████████████████████████
augroup TogglePreview
    autocmd!
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exec "normal! g'\"" | endif "自动跳转到上次退出的位置
    au VimEnter * call Enter()
augroup END

augroup PreviewInQuickFix
    autocmd!
    au FileType qf noremap <silent><buffer> p :call quickui#tools#preview_quickfix()<cr>
    au FileType qf noremap <silent><buffer> U :call quickui#preview#scroll(-20)<cr>
    au FileType qf noremap <silent><buffer> D :call quickui#preview#scroll(20)<cr>
    au FileType qf noremap <silent><buffer> K :call quickui#preview#scroll(-1)<cr>
    au FileType qf noremap <silent><buffer> J :call quickui#preview#scroll(1)<cr>
    " au FileType qf nnoremap <silent><buffer> p :PreviewQuickfix<cr>
    " au FileType qf nnoremap <silent><buffer> P :PreviewClose<cr>
    " au FileType qf noremap <silent><buffer>  U :PreviewScroll -1<cr>
    " au FileType qf noremap <silent><buffer>  D :PreviewScroll +1<cr>
augroup END

augroup MyGutentagsStatusLineRefresher
    autocmd!
    autocmd User GutentagsUpdating call lightline#update()
    autocmd User GutentagsUpdated call lightline#update()
augroup END

" vim 进入时的判断
func! Enter()
    if argc() == 0 && !has('gui_running')
        exec 'silent Explore'
    elseif argc() == 0 && has('gui_running')
        exec 'cd ~/HL/00_Repo/00_HKMS' | exec 'silent Explore'
    endif
endfunc

" 保存时自动格式化指定文件类型代码
" au BufWrite * :Autoformat
" autocmd BufWrite *.sql,*.c,*.py,*.java,*.js :Autoformat "设置发生保存事件时执行格式化
" autocmd CmdwinEnter * inoremap <expr><buffer> <TAB>
"             \pumvisible() ? "\<C-n>" : "\<TAB>"
" autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
" au VimEnter * if argc() == 0 && !has("gui_running") | exec 'silent e.' | endif
" au GUIEnter * exec 'cd ~/HL/00_Repo/00_HKMS/01_Dev' | exec 'silent e .'

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
