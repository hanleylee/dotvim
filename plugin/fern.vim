" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('fern.vim')
    finish
endif

let g:fern#disable_default_mappings = 1
let g:fern#renderer#default#leading = "   "
let g:fern#renderer#default#root_symbol = "┬ "
let g:fern#renderer#default#leaf_symbol = "├─ "
let g:fern#renderer#default#collapsed_symbol = "├─ "
let g:fern#renderer#default#expanded_symbol = "├┬ "
let g:fern#mark_symbol = '*'

let g:fern#profile = 0
let g:fern#logfile = v:null
let g:fern#loglevel = g:fern#ERROR
let g:fern#opener = 'edit'
let g:fern#hide_cursor = 1
let g:fern#keepalt_on_edit = 0
let g:fern#keepjumps_on_edit = 0

let g:fern#disable_viewer_spinner = 0
let g:fern#disable_viewer_auto_duplication = 0
let g:fern#disable_drawer_auto_winfixwidth = 0
let g:fern#disable_drawer_auto_resize = 0
let g:fern#disable_drawer_smart_quit = 0
let g:fern#disable_drawer_auto_restore_focus = 0
let g:fern#default_hidden = 1
let g:fern#default_include = '' " A default |String| pattern used to filter nodes (include).
let g:fern#default_exclude = '' " A default |String| pattern used to filter nodes (exclude).
" let g:fern#renderer = 'default'
let g:fern#comparator = 'default' " A |String| name of comparator used to sort tree items. Allowed value
let g:fern#drawer_width = 50 " A |Number| width of drawer in default.
let g:fern#drawer_keep = v:false
let g:fern#scheme#file#show_absolute_path_on_root_label = 1
let g:fern#disable_auto_buffer_delete = 0
let g:fern#disable_auto_buffer_rename = 0

function! FernInit() abort
    nmap <buffer><expr>
                \ <Plug>(fern-my-open-expand-collapse)
                \ fern#smart#leaf(
                \ "\<Plug>(fern-action-action:select)",
                \ "\<Plug>(fern-action-expand)",
                \ "\<Plug>(fern-action-collapse)",
                \ )

    " action for file mode
    " action for status(closed) dir
    " action for status(open) dir
    nmap <buffer><expr>
                \ <Plug>(fern-my-expand-or-collapse)
                \ fern#smart#leaf(
                \   "\<Plug>(fern-action-open-or-enter)",
                \   "\<Plug>(fern-action-expand)",
                \   "\<Plug>(fern-action-collapse)",
                \ )
    " nmap <buffer> <CR>      <Plug>(fern-my-open-expand-collapse)
    " nmap <buffer> <CR>      <Plug>(fern-my-expand-or-collapse)
    nmap <buffer> <CR>      <Plug>(fern-action-open-or-enter)
    nmap <buffer> -         <Plug>(fern-action-leave)
    " nmap <buffer> <C-M>     <Plug>(fern-action-open-or-enter)
    nmap <buffer> <C-C>     <Plug>(fern-action-cancel)
    nmap <buffer> a         <Plug>(fern-action-choice)
    nmap <buffer> c         <Plug>(fern-action-clipboard-clear)
    nmap <buffer> y         <Plug>(fern-action-clipboard-copy)
    nmap <buffer> d         <Plug>(fern-action-clipboard-move)
    nmap <buffer> p         <Plug>(fern-action-clipboard-paste)
    nmap <buffer> h         <Plug>(fern-action-collapse)
    nmap <buffer> fe        <Plug>(fern-action-exclude)
    nmap <buffer> g?        <Plug>(fern-action-help)
    nmap <buffer> <F1>      <Plug>(fern-action-help)
    nmap <buffer> I         <Plug>(fern-action-hidden:toggle)
    nmap <buffer> fi        <Plug>(fern-action-include)
    nmap <buffer> C         <Plug>(fern-action-enter)
    nmap <buffer><nowait> > <Plug>(fern-action-enter)
    nmap <buffer><nowait> < <Plug>(fern-action-leave)
    map  <buffer> <S-Space> <Plug>(fern-action-mark:toggle)k
    map  <buffer> <Space>   <Plug>(fern-action-mark:toggle)j
    nmap <buffer> u         <Plug>(fern-action-mark:clear)
    nmap <buffer> Md        <Plug>(fern-action-new-dir)
    nmap <buffer> Mf        <Plug>(fern-action-new-file)
    nmap <buffer> Mp        <Plug>(fern-action-new-path)
    nmap <buffer> e         <Plug>(fern-action-open)
    nmap <buffer> E         <Plug>(fern-action-open:side)
    nmap <buffer> t         <Plug>(fern-action-open:tabedit)
    nmap <buffer> T         <Plug>(fern-action-open:tabedit)gT
    nmap <buffer> l         <Plug>(fern-action-open-or-expand)
    nmap <buffer> x         <Plug>(fern-action-open:system)
    " nmap <buffer> <C-r>     <Plug>(fern-action-reload)
    nmap <buffer> <F5>      <Plug>(fern-action-reload)
    nmap <buffer> r         <Plug>(fern-action-move)
    nmap <buffer> R         <Plug>(fern-action-rename)
    nmap <buffer> .         <Plug>(fern-action-repeat)
    nmap <buffer> D         <Plug>(fern-action-trash)
    " nmap <buffer> z         <Plug>(fern-action-zoom)
    nmap <buffer> Z         <Plug>(fern-action-zoom:reset)  
    nmap <buffer> cd        <Plug>(fern-action-cd)
    nmap <buffer> CD        gg<Plug>(fern-action-cd)<C-o>
    nmap <buffer> o         <Plug>(fern-action-open:edit)
    nmap <buffer> go        <Plug>(fern-action-open:edit)<C-w>p
    nmap <buffer> i         <Plug>(fern-action-open:vsplit)
    nmap <buffer> gi        <Plug>(fern-action-open:vsplit)<C-w>p
    nmap <buffer> v         <Plug>(fern-action-open:vsplit)
    nmap <buffer> gv        <Plug>(fern-action-open:vsplit)<C-w>p
    nmap <buffer> s         <Plug>(fern-action-open:split)
    nmap <buffer> gs        <Plug>(fern-action-open:split)<C-w>p
    nmap <buffer> q         :<C-u>quit<CR>
    nmap <buffer><Leader>gs :Git<CR>
endfunction

" <C-C>                               cancel                   <Plug>(fern-action-cancel)
"                                     cd                       <Plug>(fern-action-cd)
" <Plug>(fern-action-cd)              cd:cursor                <Plug>(fern-action-cd:cursor)
" a                                   choice                   <Plug>(fern-action-choice)
"                                     clipboard-clear          <Plug>(fern-action-clipboard-clear)
" C                                   clipboard-copy           <Plug>(fern-action-clipboard-copy)
" M                                   clipboard-move           <Plug>(fern-action-clipboard-move)
" P                                   clipboard-paste          <Plug>(fern-action-clipboard-paste)
" h                                   collapse                 <Plug>(fern-action-collapse)
" c                                   copy                     <Plug>(fern-action-copy)
"                                     debug                    <Plug>(fern-action-debug)
"                                     diff                     <Plug>(fern-action-diff)
" <Plug>(fern-action-diff)            diff:edit                <Plug>(fern-action-diff:edit)
" <Plug>(fern-action-diff:edit)       diff:edit-or-error       <Plug>(fern-action-diff:edit-or-error)
" <Plug>(fern-action-diff:edit:vert)  diff:edit-or-error:vert  <Plug>(fern-action-diff:edit-or-error:vert)
" <Plug>(fern-action-diff:vert)       diff:edit:vert           <Plug>(fern-action-diff:edit:vert)
"                                     enter                    <Plug>(fern-action-enter)
"                                     ex                       <Plug>(fern-action-ex)
"                                     ex=                      <Plug>(fern-action-ex=)
" fe                                  exclude                  <Plug>(fern-action-exclude)
"                                     exclude=                 <Plug>(fern-action-exclude=)
"                                     expand                   <Plug>(fern-action-expand)
" <Plug>(fern-action-expand)          expand:in                <Plug>(fern-action-expand:in)
"                                     grep                     <Plug>(fern-action-grep)
"                                     grep=                    <Plug>(fern-action-grep=)
" ?                                   help                     <Plug>(fern-action-help)
" !                                   hidden                   <Plug>(fern-action-hidden)
" <Plug>(fern-action-hidden)          hidden:toggle            <Plug>(fern-action-hidden:toggle)
" fi                                  include                  <Plug>(fern-action-include)
"                                     include=                 <Plug>(fern-action-include=)
"                                     lcd                      <Plug>(fern-action-lcd)
" <Plug>(fern-action-lcd)             lcd:cursor               <Plug>(fern-action-lcd:cursor)
" <C-H>                               leave                    <Plug>(fern-action-leave)
" -                                   mark                     <Plug>(fern-action-mark)
" <Plug>(fern-action-mark)            mark:toggle              <Plug>(fern-action-mark:toggle)
" K                                   new-dir                  <Plug>(fern-action-new-dir)
"                                     new-dir=                 <Plug>(fern-action-new-dir=)
" N                                   new-file                 <Plug>(fern-action-new-file)
"                                     new-file=                <Plug>(fern-action-new-file=)
"                                     new-path                 <Plug>(fern-action-new-path)
"                                     new-path=                <Plug>(fern-action-new-path=)
" e                                   open                     <Plug>(fern-action-open)
" <C-M>                               open-or-enter            <Plug>(fern-action-open-or-enter)
" l                                   open-or-expand           <Plug>(fern-action-open-or-expand)
" <Plug>(fern-action-open)            open:edit                <Plug>(fern-action-open:edit)
" <Plug>(fern-action-open:edit)       open:edit-or-error       <Plug>(fern-action-open:edit-or-error)
" s                                   open:select              <Plug>(fern-action-open:select)
" E                                   open:side                <Plug>(fern-action-open:side)
" x                                   open:system              <Plug>(fern-action-open:system)
" t                                   open:tabedit             <Plug>(fern-action-open:tabedit)
" <C-L>                               redraw                   <Plug>(fern-action-redraw)
" <F5>                                reload                   <Plug>(fern-action-reload)
" <Plug>(fern-action-reload)          reload:all               <Plug>(fern-action-reload:all)
"                                     remove                   <Plug>(fern-action-remove)
" R                                   rename                   <Plug>(fern-action-rename)
" <Plug>(fern-action-rename:edit)     rename:edit-or-error     <Plug>(fern-action-rename:edit-or-error)
" <Plug>(fern-action-rename)          rename:split             <Plug>(fern-action-rename:split)
" .                                   repeat                   <Plug>(fern-action-repeat)
" i                                   reveal                   <Plug>(fern-action-reveal)
"                                     reveal=                  <Plug>(fern-action-reveal=)
"                                     tcd                      <Plug>(fern-action-tcd)
" <Plug>(fern-action-tcd)             tcd:cursor               <Plug>(fern-action-tcd:cursor)
"                                     terminal                 <Plug>(fern-action-terminal)
" <Plug>(fern-action-terminal)        terminal:edit            <Plug>(fern-action-terminal:edit)
" <Plug>(fern-action-terminal:edit)   terminal:edit-or-error   <Plug>(fern-action-terminal:edit-or-error)
" D                                   trash                    <Plug>(fern-action-trash)
" y                                   yank                     <Plug>(fern-action-yank)
" <Plug>(fern-action-yank)            yank:path                <Plug>(fern-action-yank:path)
" z                                   zoom                     <Plug>(fern-action-zoom)
" Z                                   zoom:reset               <Plug>(fern-action-zoom:reset)  
