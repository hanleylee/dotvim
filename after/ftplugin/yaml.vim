" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Turn off syntax highlighting for large YAML files.
if line('$') > 1000
  setlocal syntax=OFF
endif
