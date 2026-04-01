" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-gpt-commit')
    finish
endif

let g:gpt_commit_key = hl#get#secret_config()['DEEPSEEK_api_key']
let g:gpt_commit_url = 'https://api.deepseek.com'
let g:gpt_commit_model = 'deepseek-chat'
" let g:gpt_commit_engine = 'ollama'
" let g:gpt_commit_ollama_url = 'http://localhost:11434/api/chat'
" let g:gpt_commit_ollama_model = 'qwen2.5-coder:3b'
let g:gpt_commit_prompt =<< EOF
Write a concise and conventional commit message based on the provided git diffoutput. Use the imperative mood, present tense, and follow common commit conventions (e.g., a short summary line under 50 chars, followed by a body explaining whatand why). The message should be clear for team review and project history.
EOF
" uncomment this line below to enable proxy
" let g:gpt_commit_proxy = 'https://api.openai-proxy.org'
