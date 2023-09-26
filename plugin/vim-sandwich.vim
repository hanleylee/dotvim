" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-sandwich')
    finish
endif

" let g:sandwich#recipes += [
"       \ ]

let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
let g:sandwich#recipes += [
      \   {
      \     'buns'    : ['TagInput(1)', 'TagInput(0)'],
      \     'expr'    : 1,
      \     'filetype': ['html'],
      \     'kind'    : ['add', 'replace'],
      \     'action'  : ['add'],
      \     'input'   : ['t'],
      \   },
      \   {
      \     'buns'    : ['abc', 'bca'],
      \     'kind'    : ['add'],
      \     'action'  : ['add'],
      \     'input'   : ['B'],
      \   },
      \   {
      \     'buns'    : ['abc', 'bca'],
      \     'kind':     ['delete'],
      \     'action'  : ['delete'],
      \     'input'   : ['B'],
      \   },
      \   {
      \     'buns'    : ['**', '**'],
      \     'input'   : ['q'],
      \     'filetype': ['markdown'],
      \   },
      \ ]

function! TagInput(is_head) abort
  if a:is_head
    let s:TagLast = input('Tag: ')
    if s:TagLast !=# ''
      let tag = printf('<%s>', s:TagLast)
    else
      throw 'OperatorSandwichCancel'
    endif
  else
    let tag = printf('</%s>', matchstr(s:TagLast, '^\a[^[:blank:]>/]*'))
  endif
  return tag
endfunction
