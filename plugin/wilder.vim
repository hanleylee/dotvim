" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('wilder.nvim')
    finish
endif

call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
call wilder#set_option('modes', ['/', '?', ':'])
