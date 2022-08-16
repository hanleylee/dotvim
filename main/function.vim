" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" vim 进入时的判断
func! Enter()
    if g:is_in_gui
        " exec 'Startify'
        cd $HKMS
        " exec 'NERDTree' . '$HKMS' | wincmd p | exec 'Startify'
    else
        if argc() == 0 " 终端运行且没有参数
        endif
        " do nothing
    endif
endfunc

func! MapMetaCode(key)
    exec "set <M-" . a:key . ">=\e" . a:key
endfunc
