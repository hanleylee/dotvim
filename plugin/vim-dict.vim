" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !PlugLoaded('vim-dict')
    finish
endif
" Add additional dict folders
let g:vim_dict_dict = [
            \ '~/.vim/dict',
            \ ]

" File type override
let g:vim_dict_config = {'html':'html,javascript,css', 'markdown': 'text'}

" " Disable certain types
" let g:vim_dict_config = {'text': ''}
