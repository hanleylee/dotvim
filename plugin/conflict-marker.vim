" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('conflict-marker.vim')
    finish
endif

" Default values
let g:conflict_marker_begin = '^<<<<<<< \@='
let g:conflict_marker_common_ancestors = '^||||||| .*$'
let g:conflict_marker_separator = '^=======$'
let g:conflict_marker_end = '^>>>>>>> \@='
let g:conflict_marker_enable_highlight = 1
" let g:conflict_marker_highlight_group = 'Error'
" disable the default highlight group
let g:conflict_marker_highlight_group = ''

" Include text after begin and end markers
" let g:conflict_marker_begin = '^<<<<<<< .*$'
" let g:conflict_marker_end   = '^>>>>>>> .*$'

let g:conflict_marker_enable_mappings = 1 " [x and ]x mappings are defined as default, ct for theirs, co for ours, cn for none and cb for both
let g:conflict_marker_enable_matchit = 1 " % mapping is extended by matchit.vim

highlight ConflictMarkerBegin guibg=#2f7366
highlight ConflictMarkerOurs guibg=#2e5049
highlight ConflictMarkerTheirs guibg=#344f69
highlight ConflictMarkerEnd guibg=#2f628e
highlight ConflictMarkerCommonAncestorsHunk guibg=#754a81

augroup HLConflictMarkerDetect
    autocmd!
    autocmd BufReadPost,FileChangedShellPost,ShellFilterPost,StdinReadPost * if conflict_marker#detect#markers()
                \ | call s:on_detected()
                \ | endif
augroup END

function! s:on_detected()
    nunmap [xx
    nunmap ]xx
endfunction
