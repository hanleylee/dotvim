" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-cocoapods')
    finish
endif

let s:json_file = expand('$HL_SECRET/bnc/pod_url.json')
let g:POD_MODULE_URL = json_decode(join(readfile(s:json_file), ''))