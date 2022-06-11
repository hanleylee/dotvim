" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vimwiki')
    finish
endif


let g:vimwiki_global_ext = 0
let g:vimwiki_list = [
  \{'path': '~/repo/hkms',
  \ 'syntax': 'markdown',
  \ 'ext': '.md',
  \ 'auto_export': 0,
  \ 'nested_syntaxes': {
  \       'python': 'python',
  \       'c++': 'cpp'
  \  }
  \}
  \]
"" 是否在计算字串长度时用特别考虑中文字符
"let g:vimwiki_CJK_length = 1
"let g:vimwiki_folding = 'expr'
"let g:vimwiki_conceallevel = 1
