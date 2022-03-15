" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-test')
    finish
endif

" let test#strategy = 'floaterm'
let test#strategy = 'asyncrun'
" let test#strategy = {
"   \ 'nearest': 'neovim',
"   \ 'file':    'dispatch',
"   \ 'suite':   'basic',
" \}

" Some strategies clear the screen before executing the test command, but you can disable this:
" let g:test#preserve_screen = 1

" let g:test#echo_command = 1

let test#vim#term_position = 'belowright'

let test#filename_modifier = ':.' " test/models/user_test.rb (default)
" let test#filename_modifier = ':p' " /User/janko/Code/my_project/test/models/user_test.rb
" let test#filename_modifier = ':~' " ~/Code/my_project/test/models/user_test.rb

" Runners available are 'pytest', 'nose', 'nose2', 'djangotest', 'djangonose', 'mamba', and Python's built-in unittest as 'pyunit'
let test#python#runner = 'pytest'
let test#java#runner = 'gradletest'
let test#scala#runner = 'blooptest'
let test#go#runner = 'ginkgo'
let test#vim#runner = 'themis'
let g:test#javascript#runner = 'jest'

let test#php#phpunit#executable = 'php artisan test'
