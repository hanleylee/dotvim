" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

command! FormatCN silent! call Source('$VIMCONFIG/action/format_cn.vim')
command! FormatObjectMapper silent! Source('$VIMCONFIG/action/format_objectmapper.vim')
command! MergeMD silent! Source('$VIMCONFIG/action/merge_md.vim')
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

if PlugLoaded('asynctasks.vim')
    function! s:fzf_sink(what)
        let p1 = stridx(a:what, '<')
        if p1 >= 0
            let name = strpart(a:what, 0, p1)
            let name = substitute(name, '^\s*\(.\{-}\)\s*$', '\1', '')
            if name != ''
                exec "AsyncTask ". fnameescape(name)
            endif
        endif
    endfunction

    function! s:fzf_task()
        let rows = asynctasks#source(&columns * 48 / 100)
        let source = []
        for row in rows
            let name = row[0]
            let source += [name . '  ' . row[1] . '  : ' . row[2]]
        endfor
        let opts = { 'source': source, 'sink': function('s:fzf_sink'),
                    \ 'options': '+m --nth 1 --inline-info --tac' }
        if exists('g:fzf_layout')
            for key in keys(g:fzf_layout)
                let opts[key] = deepcopy(g:fzf_layout[key])
            endfor
        endif
        call fzf#run(opts)
    endfunction

    command! -nargs=0 AsyncTaskFzf call s:fzf_task()
endif
