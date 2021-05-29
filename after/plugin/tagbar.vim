if !PlugLoaded('tagbar')
    finish
endif

let g:tagbar_type_markdown = {
            \ 'ctagstype': 'markdown',
            \ 'ctagsbin' : '~/.vim/plugged/markdown2ctags/markdown2ctags.py',
            \ 'ctagsargs' : '-f - --sort=yes ',
            \ 'kinds' : [
            \    's:sections',
            \    'i:images'
            \ ],
            \ 'sro' : '|',
            \ 'kind2scope' : {
            \    's' : 'section',
            \ },
            \ 'sort': 0,
            \ }
