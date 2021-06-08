command! FormatCN silent! call Source('$VIMCONFIG/action/format_cn.vim')
command! FormatObjectMapper silent! Source('$VIMCONFIG/action/format_objectmapper.vim')
command! MergeMD silent! Source('$VIMCONFIG/action/merge_md.vim')
command! Run call Source("$VIMCONFIG/action/run.vim")
command! CDF silent call CDF()
command! OFD silent call OFD()
command! TrimWhitespace call TrimWhitespace()
command! -nargs=0 PlugBrowse call PlugBrowse()
command! UnescapeJSON silent! call UnescapeJSON()
command! EscapeJSON silent! call EscapeJSON()

if PlugLoaded('fzf.vim')
    command! -bang Fzm call fzf#run(fzf#wrap({'source': 'cat $FZF_MARKS_FILE | sed "s/.*: \(.*\)$/\1/" | sed "s#~#${HOME}#"', 'sink': 'e'}, <bang>0))
    command! -nargs=* -complete=file AgAll :call AgAll(<q-args>)
    command! -bang FM call fzf#run(fzf#wrap({'source': 'cat ~/.fzf-marks | sed "s/.*: \(.*\)$/\1/" | sed "s#~#${HOME}#"', 'sink': 'e'}, <bang>0))
endif

if PlugLoaded('coc.nvim')
    command! -nargs=0 Format :call CocAction('format') " Add `:Format` command to format current buffer.
    command! -nargs=? Fold :call CocAction('fold', <f-args>) " Add `:Fold` command to fold current buffer.
    command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport') " Add `:OR` command for organize imports of the current buffer.
endif
