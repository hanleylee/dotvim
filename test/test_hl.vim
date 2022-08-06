let s:suite = themis#suite("hl.vim test suite")
let s:expect = themis#helper('expect')

let s:scope = themis#helper('scope')
let s:hlvim = s:scope.funcs('autoload/hl.vim')

function s:suite.test_plug_loaded()
    " call s:expect(g:plugs).to_equal({})
    call g:assert.equals(exists('g:plugs'), 0)  " calls s:foo() in myfuncs.vim
    " call g:assert.equals(hl#plug_loaded('onedark.vim'), 1)  " calls s:foo() in myfuncs.vim
endfunction

function s:suite.test_iso_time()
    call s:expect(hl#get#iso_time(1647362029)).to_equal('2022-03-16 00:33:49+0800')
endfunction

