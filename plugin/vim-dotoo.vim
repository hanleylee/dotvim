" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

let g:dotoo#agenda#files = ['/Users/hanley/repo/hkms/*.dotoo']
let g:dotoo#capture#refile = expand('~/repo/hkms/refile.dotoo')

let g:dotoo_headline_highlight_colors = [
            \ 'Title',
            \ 'Constant',
            \ 'Identifier',
            \ 'Statement',
            \ 'PreProc',
            \ 'Type',
            \ 'Special']
let g:dotoo_headline_shade_leading_stars = 1
let g:dotoo_todo_keyword_faces = [
            \ ['TODO', [':foreground 160', ':weight bold']],
            \ ['NEXT', [':foreground 27', ':weight bold']],
            \ ['DONE', [':foreground 22', ':weight bold']],
            \ ['WAITING', [':foreground 202', ':weight bold']],
            \ ['HOLD', [':foreground 53', ':weight bold']],
            \ ['CANCELLED', [':foreground 22', ':weight bold']],
            \ ['MEETING', [':foreground 22', ':weight bold']],
            \ ['PHONE', [':foreground 22', ':weight bold']]
            \ ]
let g:dotoo_begin_src_languages = ['vim', 'json', 'javascript']
let g:dotoo#parser#todo_keywords = [
            \ 'TODO',
            \ 'NEXT',
            \ 'WAITING',
            \ 'HOLD',
            \ 'PHONE',
            \ 'MEETING',
            \ '|',
            \ 'CANCELLED',
            \ 'DONE']
let g:dotoo#agenda#warning_days = '30d'
let g:dotoo#time#time_ago_short = 0
let g:dotoo#capture#clock = 1
let g:dotoo#capture#templates = {
            \ 't': {
                \   'description': 'Todo',
                \   'lines': [
                    \     '* TODO %?',
                    \     'DEADLINE: [%(strftime(g:dotoo#time#datetime_format))]'
                    \   ],
                    \  'target': 'refile'
                    \ },
                    \ 'n': {
                        \   'description': 'Note',
                        \   'lines': ['* %? :NOTE:'],
                        \ },
                        \ 'm': {
                            \   'description': 'Meeting',
                            \   'lines': ['* MEETING with %? :MEETING:'],
                            \ },
                            \ 'p': {
                                \   'description': 'Phone call',
                                \   'lines': ['* PHONE %? :PHONE:'],
                                \ },
                                \ 'h': {
                                    \   'description': 'Habit',
                                    \   'lines': [
                                        \     '* NEXT %?',
                                        \     'SCHEDULED: [%(strftime(g:dotoo#time#date_day_format)) +1m]',
                                        \     ':PROPERTIES:',
                                        \     ':STYLE: habit',
                                        \     ':REPEAT_TO_STATE: NEXT',
                                        \     ':END:'
                                        \   ]
                                        \ }
                                        \}
" let g:dotoo#capture#templates = {
"             \ 't': {
"                 \   'target': 'refile-personal:Todos'
"                 \ }
"                 \}

" " Or add new template
" let g:dotoo#capture#templates = {
"             \ 'x': {
"                 \   'description': 'eXtra template',
"                 \   'lines': ['* eXtra %? :EXTRA:'],
"                 \ }
"                 \}

" " Or both
" let g:dotoo#capture#templates = {
"             \ 't': {
"                 \   'target': 'refile-personal:Todos'
"                 \ },
"                 \ 'x': {
"                     \   'description': 'eXtra template',
"                     \   'lines': ['* eXtra %? :EXTRA:'],
"                     \ }
"                     \}
let g:dotoo_disable_mappings = 0
let g:dotoo#agenda_views#agenda#hide_empty = 0
let g:dotoo#agenda_views#agenda#start_of = 'span'
let g:dotoo#agenda_views#agenda#span = 'week'
" gA: Agenda
" gC: Capture
