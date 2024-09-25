" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-barbaric')
    finish
endif

" The IME to invoke for managing input languages (macos, fcitx, ibus, xkb-switch)
let g:barbaric_ime = 'macos'

" The input method for Normal mode (as defined by `xkbswitch -g`, `ibus engine`, or `xkb-switch -p`)
let g:barbaric_default = 0

" The scope where alternate input methods persist (buffer, window, tab, global)
let g:barbaric_scope = 'buffer'

" Forget alternate input method after n seconds in Normal mode (disabled by default)
" Useful if you only need IM persistence for short bursts of active work.
let g:barbaric_timeout = -1

" The fcitx-remote binary (to distinguish between fcitx and fcitx5)
" let g:barbaric_fcitx_cmd = 'fcitx5-remote'

" The xkb-switch library path (for Linux xkb-switch users ONLY)
" let g:barbaric_libxkbswitch = $HOME . '/.local/lib/libxkbswitch.so'
