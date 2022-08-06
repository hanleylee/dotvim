" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

setlocal shiftwidth=2

nmap <silent><buffer> <Leader>pb  <Plug>(CocoaPodsEditBranch)
nmap <silent><buffer> <Leader>pt  <Plug>(CocoaPodsEditTag)
nmap <silent><buffer> <Leader>pv  <Plug>(CocoaPodsEditVersion)
nnoremap <silent><buffer> <Leader>pu  :PodUpdate<CR>
nnoremap <silent><buffer> <Leader>pnu :PodUpdateNoRepoUpdate<CR>
nnoremap <silent><buffer> <Leader>pi  :PodInstall<CR>
