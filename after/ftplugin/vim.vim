" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

setlocal foldmethod=marker
setlocal foldmarker={{{,}}}

nnoremap <buffer><silent>gb :PlugBrowse<cr>
nnoremap <buffer><silent>gX :silent call hl#external#OpenVimPluginHomepage('n')<cr>
vnoremap <buffer><silent>gX :<C-u>silent call hl#external#OpenVimPluginHomepage('v')<cr>

if hl#plug_loaded('vim-lookup')
    nnoremap <buffer><silent> <c-]>  :call lookup#lookup()<cr>
    nnoremap <buffer><silent> <c-t>  :call lookup#pop()<cr>
endif
