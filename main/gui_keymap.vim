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

nnoremap <M-h> gT
nnoremap <M-l> gt
nnoremap <M-H> <C-w>h
nnoremap <M-J> <C-w>j
nnoremap <M-K> <C-w>k
nnoremap <M-L> <C-w>l

nnoremap <silent><M-u> :call hl#preview_scroll('u')<cr>
nnoremap <silent><M-d> :call hl#preview_scroll('d')<cr>
nnoremap <silent><M-x> :Commands<CR>

if PlugLoaded('vim-commentary')
    nmap <D-/> gcc
    vmap <D-/> gc
endif

if PlugLoaded('asynctasks.vim')
    nnoremap <silent><D-r> :call hl#AsyncTask('file-build-run')<CR>
    nnoremap <silent><D-b> :call hl#AsyncTask('project-build')<CR>
endif
