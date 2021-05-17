" ============================================================================
" File:        vim-cursor-shape.vim
" Description: Make cursor shape flexible bwtween different modes in any termial
" Maintainer:  Hanley Lee <hanley.lei@gmail.com>
" License:     Apache 2.0
" ============================================================================

if has('gui_running') || exist('loaded_cursor_shape')
    finish
endif

let loaded_cursor_shape = 1

if !exists('g:cursor_shape_enable')
    let g:cursor_shape_enable = 1
endif

if !exists('g:cursor_shape_fix_focus')
    let g:cursor_shape_fix_focus = 1
endif

" cursor types:
"   - Block = 0
"   - Bar = 1
"   - Underline = 2
if !exists('g:cursor_shape_normal')
    let g:cursor_shape_normal = 0
endif
if !exists('g:cursor_shape_insert')
    let g:cursor_shape_insert = 1
endif
if !exists('g:cursor_shape_replace')
    let g:cursor_shape_replace = 2
endif

if exists('g:cursor_shape_always_assume_iterm') && (g:cursor_shape_always_assume_iterm == 1)
    let s:inside_iterm = 1
else
    let s:inside_iterm = exists('$ITERM_PROFILE')
endif

let s:inside_tmux = exists('$TMUX')

function! s:WrapForTmux(s)
    let tmux_start = "\<Esc>Ptmux;"
    let tmux_end   = "\<Esc>\\"

    return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

function! s:ChangeCursorShape()
    " Escape sequences

    " iTerm2 allows you to turn "focus reporting" on and off with these
    " sequences.
    "
    " When reporting is on, iTerm2 will send <Esc>[O when the window loses focus
    " and <Esc>[I when it gains focus.
    "
    " TODO: Look into how this works with iTerm tabs.  Seems a bit wonky.
    let enable_focus_reporting  = "\<Esc>[?1004h"
    let disable_focus_reporting = "\<Esc>[?1004l"

    " These sequences save/restore the screen.
    " They should NOT be wrapped in tmux escape sequences for some reason!
    let save_screen    = "\<Esc>[?1049h"
    let restore_screen = "\<Esc>[?1049l"

    " These sequences tell iTerm2 to change the cursor shape.
    let cursor_to_normal = "\<Esc>]50;CursorShape=" . g:cursor_shape_normal . "\x7"
    let cursor_to_insert = "\<Esc>]50;CursorShape=" . g:cursor_shape_insert . "\x7"
    let cursor_to_replace = "\<Esc>]50;CursorShape=" . g:cursor_shape_replace . "\x7"

    if s:inside_tmux
        " Some escape sequences (but not all, lol) need to be properly escaped
        " to get them through tmux without being eaten.

        let enable_focus_reporting = s:WrapForTmux(enable_focus_reporting) . enable_focus_reporting
        let disable_focus_reporting = disable_focus_reporting

        let cursor_to_normal = s:WrapForTmux(cursor_to_normal)
        let cursor_to_insert = s:WrapForTmux(cursor_to_insert)
        let cursor_to_replace = s:WrapForTmux(cursor_to_replace)
    endif

    " Startup/shutdown escapes
    " When starting Vim, enable focus reporting and save the screen.
    " When exiting Vim, disable focus reporting and save the screen.
    " The "focus/save" and "nofocus/restore" each have to be in this order.
    " Trust me, you don't want to go down this rabbit hole.  Just keep them in
    " this order and no one gets hurt.
    if g:cursor_shape_fix_focus
        let &t_ti = cursor_to_normal . enable_focus_reporting . save_screen . &t_ti
        let &t_te = disable_focus_reporting . restore_screen
    endif

    " Insert enter/leave escapes

    if g:cursor_shape_enable
        " When entering insert mode, change the cursor to the insert cursor.
        let &t_SI = cursor_to_insert . &t_SI
        " When exiting insert mode, change it back to normal.
        let &t_EI = cursor_to_normal . &t_EI
        " When entering replace mode, change it to replace cursor.
        let &t_SR = cursor_to_replace . &t_SR
    endif

    " Focus reporting keys/mappings
    if g:cursor_shape_fix_focus
        " Map some of Vim's unused keycodes to the sequences iTerm2 is going to send on focus lost/gained.
        " If you're already using f24 or f25, change them to something else.  Vim supports up to f37.
        " Doing things this way is nicer than just mapping the raw sequences
        " directly, because Vim won't hang after a bare <Esc> waiting for the rest of the mapping.
        execute "set <f24>=\<Esc>[O"
        execute "set <f25>=\<Esc>[I"

        " Handle the focus gained/lost signals in each mode separately.
        " The goal is to fire the autocmd and restore the state as cleanly as
        " possible.  This is easy for some modes and hard/impossible for others.

        nnoremap <silent> <f24> :silent doautocmd FocusLost %<cr>
        nnoremap <silent> <f25> :silent doautocmd FocusGained %<cr>

        onoremap <silent> <f24> <esc>:silent doautocmd FocusLost %<cr>
        onoremap <silent> <f25> <esc>:silent doautocmd FocusGained %<cr>

        vnoremap <silent> <f24> <esc>:silent doautocmd FocusLost %<cr>gv
        vnoremap <silent> <f25> <esc>:silent doautocmd FocusGained %<cr>gv

        inoremap <silent> <f24> <c-\><c-o>:silent doautocmd FocusLost %<cr>
        inoremap <silent> <f25> <c-\><c-o>:silent doautocmd FocusGained %<cr>

        cnoremap <silent> <f24> <c-\>e<SID>DoCmdFocusLost()<cr>
        cnoremap <silent> <f25> <c-\>e<SID>DoCmdFocusGained()<cr>
    endif

endfunction

function s:DoCmdFocusLost()
    let cmd = getcmdline()
    let pos = getcmdpos()

    silent doautocmd FocusLost %

    call setcmdpos(pos)
    return cmd
endfunction

function s:DoCmdFocusGained()
    let cmd = getcmdline()
    let pos = getcmdpos()

    silent doautocmd FocusGained %

    call setcmdpos(pos)
    return cmd
endfunction

if s:inside_iterm
    call s:ChangeCursorShape()
endif
