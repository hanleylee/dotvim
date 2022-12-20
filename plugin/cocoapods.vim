" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-cocoapods')
    finish
endif

let g:PodsConfigFile = expand('$HL_SECRET/bnc/pods.json')
let g:CocoaPodsDefaultMap = 1
