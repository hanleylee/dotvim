" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

function! hl#fern_mapping_fzf#init_map()
    nmap <buffer> ff <Plug>(fern-action-fzf-files)
    nmap <buffer> fd <Plug>(fern-action-fzf-dirs)
    nmap <buffer> fa <Plug>(fern-action-fzf-both)
    nmap <buffer> frf <Plug>(fern-action-fzf-root-files)
    nmap <buffer> frd <Plug>(fern-action-fzf-root-dirs)
    nmap <buffer> fra <Plug>(fern-action-fzf-root-both)
endfunction
