" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" For File Manipulate {{{
command! CDF silent call CDF()
command! OFD silent call OFD()
command! CDIT silent call CDIT()
command! -nargs=0 OpenInBrowser silent call OpenInBrowser()
command! ChezmoiSwap call hl#chezmoi#swap_between_target_and_source()
command! LoadTemplate call hl#LoadTemplate(0)
command! Template call hl#LoadTemplate(1)
command Delete if delete(expand('%')) | echohl WarningMsg | echo "删除当前文件失败" | echohl None | endif
"}}}

" Format {{{
" command! -range=% -nargs=0 FormatCN silent! <line1>,<line2> call hl#Format_CN()
command! FormatObjectMapper silent! call hl#format_objectmapper()
command! -range FormatSurgeRule '<,'> call hl#format_surge_rule()
command! -range=% -nargs=0 FormatCN let b:view = winsaveview() | silent! <line1>,<line2> call hl#format_cn() | call winrestview(b:view)
command! MergeMD silent! call hl#markdown#merge_md()
command! TrimTrailingWhitespace call TrimTrailingWhitespace()
" 删除拖尾的空白
" command -range=% -bar TWS <line1>,<line2>s/\s\+$//|nohls|normal ``
command! UnescapeJSON silent! call UnescapeJSON()
command! EscapeJSON silent! call EscapeJSON()
" }}}

" Command {{{
command! ChezmoiApply !chezmoi apply --source-path "%"
"`:Redir` followed by either shell or vim command
command! -nargs=+ -complete=command Redir silent call Redir(<q-args>)
" 某个 pattern 出现的次数
command -range=% -nargs=1 Count <line1>,<line2>s/<args>//gn|nohls
command CenterFull call hl#center_full()
" }}}

" iOS {{{
command! MVXC silent call MVXC()
command! PodUpdate call hl#cocoapods#execute('pod update')
command! PodInstall call hl#cocoapods#execute('pod install')
command! PodUpdateNoRepoUpdate call hl#cocoapods#execute('pod update --no-repo-update')
" }}}

if hl#plug_loaded('asynctasks.vim') && hl#plug_loaded('fzf.vim')
    command! -nargs=0 AsyncTaskFzf call hl#asynctasks#fzf_task()
endif

if hl#plug_loaded('coc.nvim')
    command! -nargs=0 Format :call CocAction('format') " Add `:Format` command to format current buffer.
    command! -nargs=? Fold :call CocAction('fold', <f-args>) " Add `:Fold` command to fold current buffer.
    command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport') " Add `:OR` command for organize imports of the current buffer.
endif

if hl#plug_loaded('fzf.vim')
    " The query history for this command will be stored as 'ls' inside g:fzf_history_dir. The name is ignored if g:fzf_history_dir is not defined.
    " command! -bang -complete=dir -nargs=? LS call fzf#run(fzf#wrap('ls', {'source': 'ls', 'dir': <q-args>}, <bang>0))
    command! -nargs=* -complete=file AgWithHidden :call hl#fzf#ag_all(<q-args>, '--hidden')
    command! -nargs=* -complete=file AgAll :call hl#fzf#ag_all(<q-args>, '-u') " all with ignored and hidden files
    command! -nargs=* FzfExploreCurrent call hl#fzf#explore_current(shellescape(<q-args>))
    " command! -bang FM call fzf#run(fzf#wrap({'source': 'cat $FZF_MARKS_FILE | sed "s/.*: \(.*\)$/\1/" | sed "s#~#${HOME}#"',
    " command! -bang FM call fzf#run(fzf#wrap({'source': 'cat ~/.fzf-marks | sed "s/.*: \(.*\)$/\1/" | sed "s#~#${HOME}#"', 'sink': 'e'}, <bang>0))
    command! -bang FM call fzf#run(fzf#wrap({'source': 'cat $FZF_MARKS_FILE | grep "^[^#]" | sed "s/.*: \(.*\)$/\1/"',
                \ 'options': "-m --preview 'tree -N -C -l -L 1 {} | head -500'"
                \ }, <bang>0))
    command! -bang Args call fzf#run(fzf#wrap('args',
                \ {'source': map([argidx()]+(argidx()==0?[]:range(argc())[0:argidx()-1])+range(argc())[argidx()+1:], 'argv(v:val)')}, <bang>0))
    command! -bang -nargs=* GGrep call fzf#vim#grep(
                \   'git grep --line-number -- '.shellescape(<q-args>), 0,
                \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)
endif

if hl#plug_loaded('vim-floaterm')
    command! LF FloatermNew lf
    command! FFF FloatermNew fff
    command! NNN FloatermNew nnn
    command! XPLR FloatermNew xplr
    command! Ranger FloatermNew ranger
    command! Vifm FloatermNew vifm

endif

