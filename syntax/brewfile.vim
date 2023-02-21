" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if exists('b:current_syntax')
    finish
endif

" Load ruby syntax
source $VIMRUNTIME/syntax/ruby.vim
unlet b:current_syntax

syn keyword brewfileDirective brew cask tap mas cask_args

hi def link brewfileDirective Keyword

let b:current_syntax = 'brewfile'
