" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('lightline.vim')
    finish
endif

" \ 'tabline_separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
" \ 'separator': { 'left': "\ue0b0", 'right': "\ue0b2" },
let g:lightline = {
            \   'colorscheme': g:colors_name,
            \   'subseparator': { 'left': '|', 'right': '|' },
            \   'tabline_subseparator': { 'left': '|', 'right': '|' },
            \   'active': {
            \       'left': [['mode', 'paste'],
            \                ['gitbranch', 'readonly', 'filename', 'modified'],
            \                ['buffers_count', 'coc_status', 'gutentags', 'git_diff_count'] ],
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
            \       'mode': 'hl#lightline#LightlineMode',
            \       'gitbranch': 'hl#lightline#LightlineFugitive',
            \       'readonly': 'hl#lightline#LightlineReadonly',
            \       'buffers_count': 'hl#lightline#BuffersCount',
            \       'gutentags': 'gutentags#statusline',
            \       'coc_status': 'hl#lightline#CocDiagnosticStatus1',
            \       'git_diff_count': 'hl#lightline#GitDiffCount',
            \       'filename': 'hl#lightline#FileNameWithIcon',
            \   },
            \ }
