" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !g:is_in_macvim_gui " macvim 自带这些快捷键, 不需要额外设置
    "map <D-v>      "+gP
    "cmap <D-v>     <C-R>+
    " vnoremap  <D-c>         "+y
    " vnoremap  <D-x>         "+x
    " tmap      <D-v>         <C-w>"+
    " nnoremap  <D-v>         "+p
    " vnoremap  <D-v>         "+p
    " inoremap  <D-v>         <C-r><C-o>+
    " cnoremap  <D-v>         <C-r><C-o>+
    noremap   <D-Left>      <Home>
    noremap!  <D-Left>      <Home>
    noremap   <D-Right>     <End>
    noremap!  <D-Right>     <End>
    " noremap   <D-Up>        <C-Home>
    " inoremap  <D-Up>        <C-Home>
    " noremap   <D-Down>      <C-End>
    " inoremap  <D-Down>      <C-End>
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
nnoremap <silent><M-H> :tabmove -1<CR>
nnoremap <silent><M-L> :tabmove +1<CR>

noremap  <silent><D-1> :tabnext 1<CR>
noremap  <silent><D-2> :tabnext 2<CR>
noremap  <silent><D-3> :tabnext 3<CR>
noremap  <silent><D-4> :tabnext 4<CR>
noremap  <silent><D-5> :tabnext 5<CR>
noremap  <silent><D-6> :tabnext 6<CR>
noremap  <silent><D-7> :tabnext 7<CR>
noremap  <silent><D-8> :tabnext 8<CR>
noremap  <silent><D-9> :tabnext 9<CR>
noremap  <silent><D-0> :tabnext 10<CR>
nnoremap <silent><D-=> :call hl#ui#UpdateFontSize('up')<CR>
nnoremap <silent><D--> :call hl#ui#UpdateFontSize('down')<CR>

noremap <silent><D-u> :TestFile<CR>

" Text Movement
inoremap <M-f>    <C-Right>
cnoremap <M-f>    <C-Right>
tnoremap <M-f>    <C-Right>
inoremap <M-b>    <C-Left>
cnoremap <M-b>    <C-Left>
tnoremap <M-b>    <C-Left>

" nnoremap <M-j> gj
" nnoremap <M-k> gk
" vnoremap <M-j> gj
" vnoremap <M-k> gk

" Movement on popup window
nnoremap <silent><M-u> :call hl#ui#preview_scroll('u')<cr>
nnoremap <silent><M-d> :call hl#ui#preview_scroll('d')<cr>
nnoremap <silent><M-k> :call hl#ui#preview_scroll('k')<cr>
nnoremap <silent><M-j> :call hl#ui#preview_scroll('j')<cr>

noremap <silent><M-U> :call hl#ui#previous_win_scroll('u')<cr>
noremap <silent><M-D> :call hl#ui#previous_win_scroll('d')<cr>
noremap <silent><M-K> :call hl#ui#previous_win_scroll('k')<cr>
noremap <silent><M-J> :call hl#ui#previous_win_scroll('j')<cr>
" noremap <silent><S-M-[> :call hl#ui#previous_win_scroll(2)<cr>
" noremap <silent><S-M-]> :call hl#ui#previous_win_scroll(3)<cr>
noremap <silent><M-{> :call hl#ui#previous_win_scroll('gg')<cr>
noremap <silent><M-}> :call hl#ui#previous_win_scroll('G')<cr>

" quick move bracket to backward
" nnoremap <expr> <M-B>  hl#operate#move_bracket_to_left()
" inoremap <expr> <M-B>  hl#operate#move_bracket_to_left()

" quick move any character to backward
nnoremap <expr> <M-B>  hl#operate#move_any_char_to_left()
inoremap <expr> <M-B>  hl#operate#move_any_char_to_left()

" quickly close all tabs
nnoremap <silent><M-q>       :call hl#ui#close_all()<CR>

" add sign at the trailing
" inoremap <M-;> <C-o>m`<C-o>A;<C-o>``
" nnoremap <M-;> m`A;<Esc>``
inoremap <silent> <M-;> <C-o>:call hl#operate#append_text(';')<CR>
nnoremap <silent> <M-;> :call hl#operate#append_text(';')<CR>
inoremap <silent> <M-,> <C-o>:call hl#operate#append_text(',')<CR>
nnoremap <silent> <M-,> :call hl#operate#append_text(',')<CR>

if hl#plug_loaded('fzf.vim')
    nnoremap <silent><M-x> :Commands<CR>
    nnoremap <silent><M-t> :Tags<CR>
    inoremap <silent><M-t> ⦿
    cnoremap <silent><M-t> ⦿
    tnoremap <silent><M-t> ⦿
    nnoremap <M-m>       :FM<CR>
endif

nmap <D-/> gcc
vmap <D-/> gc

if hl#plug_loaded('asynctasks.vim')
    nnoremap <silent><D-r> :<C-u>call hl#async_file_run()<CR>
    " nnoremap <silent><D-b> :<C-u>call hl#async_task('project-build')<CR>
    nnoremap <silent><D-.> :<C-u>AsyncStop<CR>
    nnoremap <silent><M-.> :AsyncStop<CR>
endif

if hl#plug_loaded('vim-quickui')
    " nnoremap <silent><F1>                :call quickui#tools#preview_tag('')<cr>
    nnoremap <silent><D-d>          :call hl#quickui#show_dict(expand("<cword>"))<cr>
    vnoremap <silent><D-d>          :<C-u>call hl#quickui#show_dict(hl#text#visual_selection(visualmode()))<cr>
    nnoremap <silent><D-t>          :call hl#quickui#show_translate(expand("<cword>"))<cr>
    vnoremap <silent><D-t>          :<C-u>call hl#quickui#show_translate(hl#text#visual_selection(visualmode()))<cr>
endif

if hl#plug_loaded('vim-floaterm')
    nnoremap <silent><M-=>          :FloatermToggle<CR>
    tnoremap <silent><M-=>          <C-\><C-n>:FloatermToggle<CR>
endif

" cosco.vim {{{
if hl#plug_loaded('cosco.vim')
    nmap <silent> <M-;> <Plug>(cosco-commaOrSemiColon)
    imap <silent> <M-;> <c-o><Plug>(cosco-commaOrSemiColon)
endif
" }}}

