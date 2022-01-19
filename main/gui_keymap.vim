" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !g:is_in_macvim_gui " macvim 自带这些快捷键
    "map <D-v>      "+gP
    "cmap <D-v>     <C-R>+
    vnoremap  <D-c>         "+y
    vnoremap  <D-x>         "+x
    tmap      <D-v>         <C-w>"+
    nnoremap  <D-v>         "+p
    vnoremap  <D-v>         "+p
    inoremap  <D-v>         <C-r><C-o>+
    cnoremap  <D-v>         <C-r><C-o>+
    noremap   <D-Left>      <Home>
    noremap!  <D-Left>      <Home>
    noremap   <D-Right>     <End>
    noremap!  <D-Right>     <End>
    noremap   <D-Up>        <C-Home>
    inoremap  <D-Up>        <C-Home>
    noremap   <D-Down>      <C-End>
    inoremap  <D-Down>      <C-End>
    inoremap  <D-BS>        <C-u>
    nnoremap  <D-w>         :x<cr>
    inoremap  <D-w>         <Esc>:x<cr>
    nnoremap  <D-s>         :w<cr>
    noremap   <D-s>         :update<CR>
    vnoremap  <D-s>         <C-c>:update<CR>
    inoremap  <D-s>         <Esc>:update<CR>gi
    noremap   <D-z>         u
    inoremap  <D-z>         <C-o>u
    noremap   <S-D-z>       <C-r>
    inoremap  <S-D-z>       <C-o><C-r>
    noremap   <D-a>         gggH<C-o>G
    inoremap  <D-a>         <C-o>gg<C-o>gH<C-o>G
    cnoremap  <D-a>         <C-c>gggH<C-o>G
    onoremap  <D-a>         <C-c>gggH<C-o>G
    snoremap  <D-a>         <C-c>gggH<C-o>G
    xnoremap  <D-a>         <C-c>ggVG
    noremap   <expr> <D-F>  "/"
    inoremap  <expr> <D-F>  "\<C-\>\<C-o>/"
    cnoremap  <expr> <D-F>  "\<C-\>\<C-o>/"

    nnoremap   <S-D-Left>     <S-Home>
    vnoremap   <S-D-Left>     <S-Home>
    inoremap   <S-D-Left>     <S-Home>
    nnoremap   <S-M-Left>     <S-C-Left>
    vnoremap   <S-M-Left>     <S-C-Left>
    inoremap   <S-M-Left>     <S-C-Left>

    nnoremap   <S-D-Right>    <S-End>
    vnoremap   <S-D-Right>    <S-End>
    inoremap   <S-D-Right>    <S-End>
    nnoremap   <S-M-Right>    <S-C-Right>
    vnoremap   <S-M-Right>    <S-C-Right>
    inoremap   <S-M-Right>    <S-C-Right>

    nnoremap   <S-D-Up>       <S-C-Home>
    vnoremap   <S-D-Up>       <S-C-Home>
    inoremap   <S-D-Up>       <S-C-Home>

    nnoremap   <S-D-Down>     <S-C-End>
    vnoremap   <S-D-Down>     <S-C-End>
    inoremap   <S-D-Down>     <S-C-End>
    no   <M-Left>       <C-Left>
    no!  <M-Left>       <C-Left>
    no   <M-Right>      <C-Right>
    no!  <M-Right>      <C-Right>
    ino  <M-BS>         <C-w>
    ino  <M-Up>         <C-o>{
    no   <M-Up>         {
    no   <M-Down>       }
    ino  <M-Down>       <C-o>}
endif

nnoremap <silent><M-h> gT
nnoremap <silent><M-l> gt
noremap  <silent><D-1> :tabn 1<cr>
noremap  <silent><D-2> :tabn 2<cr>
noremap  <silent><D-3> :tabn 3<cr>
noremap  <silent><D-4> :tabn 4<cr>
noremap  <silent><D-5> :tabn 5<cr>
noremap  <silent><D-6> :tabn 6<cr>
noremap  <silent><D-7> :tabn 7<cr>
noremap  <silent><D-8> :tabn 8<cr>
noremap  <silent><D-9> :tabn 9<cr>
noremap  <silent><D-0> :tabn 10<cr>
nnoremap <silent><M-H> <C-w>h
nnoremap <silent><M-J> <C-w>j
nnoremap <silent><M-K> <C-w>k
nnoremap <silent><M-L> <C-w>l

" Text Movement
inoremap <M-f>    <C-Right>
cnoremap <M-f>    <C-Right>
tnoremap <M-f>    <C-Right>
inoremap <M-b>    <C-Left>
cnoremap <M-b>    <C-Left>
tnoremap <M-b>    <C-Left>

" Movement on popup window
nnoremap <silent><M-u> :call hl#preview_scroll('u')<cr>
nnoremap <silent><M-d> :call hl#preview_scroll('d')<cr>
nnoremap <silent><M-k> :call hl#preview_scroll('k')<cr>
nnoremap <silent><M-j> :call hl#preview_scroll('j')<cr>

" quick move bracket to backward
" nnoremap <expr> <M-B>  hl#move_bracket_to_left()
" inoremap <expr> <M-B>  hl#move_bracket_to_left()

" quick move any character to backward
nnoremap <expr> <M-B>  hl#move_any_char_to_left()
inoremap <expr> <M-B>  hl#move_any_char_to_left()

if hl#plug_loaded('fzf.vim')
    nnoremap <silent><M-x> :Commands<CR>
    nnoremap <silent><M-t> :Tags<CR>
    inoremap <silent><M-t> ⦿
    cnoremap <silent><M-t> ⦿
    tnoremap <silent><M-t> ⦿
endif

if hl#plug_loaded('vim-commentary')
    nmap <D-/> gcc
    vmap <D-/> gc
endif

if hl#plug_loaded('asynctasks.vim')
    noremap <silent><D-r> :<C-u>call hl#async_task('file-build-run')<CR>
    noremap <silent><D-b> :<C-u>call hl#async_task('project-build')<CR>
    noremap <silent><D-.> :<C-u>AsyncStop<CR>
endif

if hl#plug_loaded('vim-quickui')
    " nnoremap <silent><F1>                :call quickui#tools#preview_tag('')<cr>
    nnoremap <silent><D-d>          :call hl#quickui#show_dict(expand("<cword>"))<cr>
    vnoremap <silent><D-d>          :<C-u>call hl#quickui#show_dict(hl#visual_selection())<cr>
    nnoremap <silent><D-t>          :call hl#quickui#show_translate(expand("<cword>"))<cr>
    vnoremap <silent><D-t>          :<C-u>call hl#quickui#show_translate(hl#visual_selection())<cr>
endif

if hl#plug_loaded('vim-floaterm')
    nnoremap <silent><M-=>          :FloatermToggle<CR>
    tnoremap <silent><M-=>          <C-\><C-n>:FloatermToggle<CR>
endif
