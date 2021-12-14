" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

setlocal shiftwidth=4

" Turn off syntax highlighting for large YAML files.
if line('$') > 1000
  setlocal syntax=OFF
endif
