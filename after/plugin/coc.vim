if !PlugLoaded('coc.nvim')
    finish
endif

augroup CocAutoGroup
    autocmd!
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    autocmd CursorHold * silent call CocActionAsync('highlight')
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
augroup end

command! -nargs=0 Format :call CocAction('format') " Add `:Format` command to format current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>) " Add `:Fold` command to fold current buffer.
command! -nargs=0 OR   :call CocAction('runCommand', 'editor.action.organizeImport') " Add `:OR` command for organize imports of the current buffer.

nmap <Leader>en       <Plug>(coc-diagnostic-next)<CR>
nmap <Leader>ep       <Plug>(coc-diagnostic-prev)<CR>
nmap <silent> gd      <Plug>(coc-definition)
nmap <silent> gy      <Plug>(coc-type-definition)
nmap <silent> gi      <Plug>(coc-implementation)
nmap <silent> gr      <Plug>(coc-references)
nmap <leader>rn       <Plug>(coc-rename)
nnoremap <silent><Leader>D :call <SID>show_documentation()<CR>

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

nnoremap <silent><nowait> <Space>cd  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <Space>ce  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <Space>cc  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <Space>co  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <Space>cs  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <Space>cn  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <Space>cp  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <Space>cr  :<C-u>CocListResume<CR>
nnoremap <silent><nowait> <Space>cy  :<C-u>CocList -A --normal yank<cr>
" inoremap <silent><expr> <TAB>
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" " \ pumvisible() ? coc#_select_confirm() : "help select first complete when there's no selected.

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<S-tab>'

hi CocHighlightText cterm=bold ctermbg=238 ctermfg=NONE  guibg=#444444 guifg=NONE gui=bold

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
    else
        execute '!' . &keywordprg . " " . expand('<cword>')
    endif
endfunction

