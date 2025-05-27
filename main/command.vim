" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" -nargs=0: no argument allowed(default)
" -nargs=1: one argument is required
" -nargs=*: any number of arguments allowed
" -nargs=?: 0 or 1 argument allowed
" -nargs=+: one argument or more are required

" special strings
" %: relative path of the current file
" <cword>: word under the cursor
" <cWORD>: WORD under the cursor
" <cfile>: filepath under the cursor
" <afile>: file open in the buffer when executing autocommands
" <sfile>: filename of sourced file when used with command ':source'
"
" don't add 'silent' so that make it easier to debug, use 'silent' in keymap layer!

" For File Manipulate {{{
command! MVXC silent call hl#external#MVXC()
" Finder {{{
command! MVFD silent call hl#external#interact_finder('edit')
command! CDFD silent call hl#external#interact_finder('cd')
command! OFD  silent call hl#external#interact_finder('open')
" }}}
" command! CDIT silent call hl#external#CDIT()
command! OpenInBrowser call hl#external#OpenInBrowser()
command! ChezmoiApply !chezmoi apply --source-path "%"
command! ChezmoiSwap call hl#chezmoi#swap_between_target_and_source()
command! CopyToTempTab call hl#copy_to_temp_tab()
command! EditTemp :tab drop ~/.cache/tmp.md<CR>
command! -bang LoadTemplate call hl#LoadTemplate("<bang>")
command! -nargs=1 -complete=file NewTemplate call hl#NewTemplate(<q-args>)
command! DeleteCurrentFile if delete(expand('%')) | echohl WarningMsg | echo "Fail to delete current file" | echohl None | endif
" 某个 pattern 出现的次数
command! -range=% -nargs=? Count let s:view = winsaveview() | <line1>,<line2>s/<f-args>//gn|nohls | call winrestview(s:view)
command! MatchCount call hl#util#SearchMatchCount()
" # Command Delview (and it's abbreviation 'delview')
command! DelView call hl#util#DeleteView()
" Lower-case user commands: http://vim.wikia.com/wiki/Replace_a_builtin_command_using_cabbrev
cabbrev delview <C-r>=(getcmdtype()==':' && getcmdpos()==1 ? 'DelView' : 'delview')<CR>
"}}}

" Format {{{
" command! -range=% -nargs=0 FormatCN silent! <line1>,<line2> call hl#format#cn()
command! -range=% GeneralFormat let s:view = winsaveview() | <line1>,<line2> call hl#format#general() | call winrestview(s:view)
command! FormatObjectMapper call hl#format#objectmapper()
command! -range FormatSurgeRule '<,'> call hl#text#format_surge_rule()
command! -range=% FormatCN let s:view = winsaveview() | silent! <line1>,<line2> call hl#format#cn() | call winrestview(s:view)
command! -range=% RmTrailingSpace let s:view = winsaveview() | silent! <line1>,<line2> call hl#operate#remove_trailing_space() | call winrestview(s:view)
command! -range=% RmEmptyLine let s:view = winsaveview() | silent! <line1>,<line2> call hl#operate#remove_empty_line() | call winrestview(s:view)
command! MergeMD call hl#markdown#merge_md()
" 删除拖尾的空白
" command -range=% -bar TWS <line1>,<line2>s/\s\+$//|nohls|normal ``
command! UnescapeJSON call hl#operate#UnescapeJSON()
command! EscapeJSON call hl#operate#EscapeJSON()
" }}}

" Command {{{
"`:Redir` followed by either shell or vim command
command! -nargs=+ -complete=command Redir call hl#external#Redir(<q-args>)
command! -nargs=+ -complete=shellcmd Superman call hl#Superman(<f-args>)
" }}}

if hl#plug_loaded('asynctasks.vim') && hl#plug_loaded('fzf.vim')
    command! AsyncTaskFzf call hl#asynctasks#fzf_task()
endif

if hl#plug_loaded('coc.nvim')
    command! CocFormat :call CocAction('format') " Add `:Format` command to format current buffer.
    command! OR :call CocAction('runCommand', 'editor.action.organizeImport') " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=? CocFold :call CocAction('fold', <f-args>) " Add `:Fold` command to fold current buffer.
endif

if hl#plug_loaded('fzf.vim')
    " The query history for this command will be stored as 'ls' inside g:fzf_history_dir. The name is ignored if g:fzf_history_dir is not defined.
    command! -bang -complete=dir -nargs=? LS call fzf#run(fzf#wrap('ls', {'source': 'ls', 'dir': <q-args>}, <bang>0))
    command! -nargs=* -complete=file AgWithHidden :call hl#fzf#ag_all(<q-args>, '--hidden')
    command! -nargs=* -complete=file AgAll :call hl#fzf#ag_all(<q-args>, '-u') " all with ignored and hidden files
    command! -nargs=* FzfExploreCurrent call hl#fzf#explore_current(shellescape(<q-args>))
    command! -bang FM call fzf#run(fzf#wrap({'source': 'cat $HOME/.fzf-marks | grep "^[^#]" | sed "s/.*: \(.*\)$/\1/"',
                \ 'options': "-m --preview 'tree -N -C -l -L 1 {} | head -500'"
                \ }, <bang>0))
    command! -bang Args call fzf#run(fzf#wrap('args', {'source': map([argidx()]+(argidx()==0?[]:range(argc())[0:argidx()-1])+range(argc())[argidx()+1:], 'argv(v:val)')}, <bang>0))
    command! -bang -nargs=* GGrep call fzf#vim#grep('git grep --line-number -- '.shellescape(<q-args>), 0, fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
    command! -nargs=1 -complete=file FzfFilesWithFilePath call fzf#vim#files(fnamemodify(<q-args>, ':p:h'), fzf#vim#with_preview())
    command! -nargs=1 -complete=file FzfPreLevel call fzf#vim#files(fnamemodify(getcwd(), ':h'), fzf#vim#with_preview())

endif

if hl#plug_loaded('vim-floaterm')
    command! LF FloatermNew lf
    command! FFF FloatermNew fff
    command! NNN FloatermNew nnn
    command! XPLR FloatermNew xplr
    command! Ranger FloatermNew ranger
    command! Vifm FloatermNew vifm

endif

