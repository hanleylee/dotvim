" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('editorconfig-vim')
    finish
endif

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Disable for a specific filetype
" au FileType gitcommit let b:EditorConfig_disable = 1

" Disable rules
" let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']
