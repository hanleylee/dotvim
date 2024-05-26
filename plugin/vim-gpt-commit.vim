
" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-gpt-commit')
    finish
endif

let g:gpt_commit_key = hl#get#secret_config()['OPENAI_PROXY_CLOSEAI']
" uncomment this line below to enable proxy
" let g:gpt_commit_proxy = 'https://api.openai-proxy.org'
