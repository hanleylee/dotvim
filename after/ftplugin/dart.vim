" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

setlocal shiftwidth=2

if hl#plug_loaded('vim-flutter')
    " Some of these key choices were arbitrary;
    " it's just an example.
    nnoremap <buffer> <leader>Fs :FlutterRun<cr>
    nnoremap <buffer> <leader>Fa :FlutterAttach<cr>
    nnoremap <buffer> <leader>Fr :FlutterHotReload<cr>
    nnoremap <buffer> <leader>FR :FlutterHotRestart<cr>
    nnoremap <buffer> <leader>FD :FlutterVisualDebug<cr>
    nnoremap <buffer> <leader>Fq :FlutterQuit<cr>

    if g:is_in_macvim_gui
        " Enable Flutter menu
        call FlutterMenu()
        nnoremap <buffer> <silent><D-r> :FlutterHotReload<CR>
        nnoremap <buffer> <silent><D-R> :FlutterHotRestart<CR>
    endif

endif
