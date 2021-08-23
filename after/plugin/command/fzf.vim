" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('fzf.vim')
    finish
endif

command! -nargs=* -complete=file AgAll :call hl#fzf#ag_all(<q-args>)
command! -bang FM call fzf#run(fzf#wrap({'source': 'cat $FZF_MARKS_FILE | sed "s/.*: \(.*\)$/\1/" | sed "s#~#${HOME}#"', 'sink': 'e'}, <bang>0))
" command! -bang FM call fzf#run(fzf#wrap({'source': 'cat ~/.fzf-marks | sed "s/.*: \(.*\)$/\1/" | sed "s#~#${HOME}#"', 'sink': 'e'}, <bang>0))
