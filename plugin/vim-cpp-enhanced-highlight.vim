" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('vim-cpp-enhanced-highlight')
    finish
endif

" Highlighting of class scope, disabled by default
let g:cpp_class_scope_highlight = 1

" Highlighting of member variables, disabled by default.
let g:cpp_member_variable_highlight = 1

" Highlighting of class names in declarations, disabled by default.
let g:cpp_class_decl_highlight = 1

" Highlighting of POSIX functions, disabled by default.
let g:cpp_posix_standard = 1

" works in most cases, but can be a little slow on large files.
" let g:cpp_experimental_simple_template_highlight = 1

" faster implementation but has some corner cases where it doesn't work
let g:cpp_experimental_template_highlight = 1

" highlight the keywords concept and requires as well as all named requirements (like DefaultConstructible) in the standard library.
let g:cpp_concepts_highlight = 1

" Highlighting of user defined functions can be disabled
" let g:cpp_no_function_highlight = 1
