"*********************   lightline   *****************************************
            " \ 'tabline_separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
            " \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
let g:lightline = {
            \   'colorscheme': 'onedark',
            \   'subseparator': { 'left': '|', 'right': '|' },
            \   'tabline_subseparator': { 'left': '|', 'right': '|' },
            \   'active': {
            \       'left': [['mode', 'paste'],
            \                ['gitbranch', 'readonly', 'filename', 'modified'],
            \                ['buffers', 'cocstatus', 'gutentags'] ],
            \       'right': [['lineinfo'],
            \                 ['percent'],
            \                 ['fileformat', 'fileencoding', 'filetype']]
            \   },
            \   'inactive': {
            \       'left': [ [ 'filename' ] ],
            \       'right': [ [ 'lineinfo' ],
            \                   [ 'percent' ] ]
            \   },
            \   'tabline': {
            \       'left': [ [ 'tabs' ] ],
            \       'right': [ [ 'close' ] ]
            \   },
            \   'tab': {
            \       'active': [ 'tabnum', 'filename', 'modified' ],
            \       'inactive': [ 'tabnum', 'filename', 'modified' ]
            \   },
            \   'component': {
            \       'mode': '%{lightline#mode()}',
            \       'absolutepath': '%F',
            \       'relativepath': '%f',
            \       'filename': '%t',
            \       'modified': '%M',
            \       'bufnum': '%n',
            \       'paste': '%{&paste?"PASTE":""}',
            \       'readonly': '%R',
            \       'charvalue': '%b',
            \       'charvaluehex': '%B',
            \       'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
            \       'fileformat': '%{&ff}',
            \       'filetype': '%{&ft!=#""?&ft:"no ft"}',
            \       'percent': '%3p%%',
            \       'percentwin': '%P',
            \       'spell': '%{&spell?&spelllang:""}',
            \       'lineinfo': ' %3l:%-2v',
            \       'line': '%l',
            \       'column': '%c',
            \       'close': '%999X X ',
            \       'winnr': '%{winnr()}'
            \   },
            \   'component_visible_condition': {
            \       'modified': '&modified||!&modifiable',
            \       'readonly': '&readonly',
            \       'paste': '&paste',
            \       'spell': '&spell'
            \   },
            \   'component_type': {
            \       'tabs': 'tabsel',
            \       'close': 'raw'
            \   },
            \   'tab_component_function': {
            \       'filename': 'lightline#tab#filename',
            \       'modified': 'lightline#tab#modified',
            \       'readonly': 'lightline#tab#readonly',
            \       'tabnum': 'lightline#tab#tabnum'
            \   },
            \   'component_function': {
            \       'mode': 'LightlineMode',
            \       'gitbranch': 'LightlineFugitive',
            \       'readonly': 'LightlineReadonly',
            \       'buffers': 'BuffersCount',
            \       'gutentags': 'gutentags#statusline',
            \       'cocstatus': 'coc#status'
            \   },
            \ }
           " \       'linter': 'LinterStatus',

function! LightlineMode()
    return expand('%:t') =~# '^__Tagbar__' ? 'Tagbar':
                \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
                \ &filetype ==# 'unite' ? 'Unite' :
                \ &filetype ==# 'vimfiler' ? 'VimFiler' :
                \ &filetype ==# 'vimshell' ? 'VimShell' :
                \ lightline#mode()
endfunction

function! LightlineFugitive()
    if exists('*FugitiveHead')
        let branch = FugitiveHead()
        return branch !=# '' ? ' '.branch : ''
    endif
    return ''
endfunction

" function! LinterStatus() abort
"     let l:counts = ale#statusline#Count(bufnr(''))
"     let l:all_errors = l:counts.error + l:counts.style_error
"     let l:all_non_errors = l:counts.total - l:all_errors
"     return l:counts.total == 0 ? '' : printf('%d  %d ', all_non_errors, all_errors)
" endfunction

function! LightlineReadonly()
    return &readonly ? '' : ''
endfunction

func! BuffersCount()
    let a = len(filter(getbufinfo(), 'v:val.changed == 1'))
    let b = len(getbufinfo({'buflisted':1}))
    return a.'/'.b
endfunc

function! s:get_gutentags_status(mods) abort
    let l:msg = ''
    if index(a:mods, 'ctags') >= 0
        let l:msg .= '♨'
    endif
    if index(a:mods, 'cscope') >= 0
        let l:msg .= '♺'
    endif
    return l:msg
endfunction

