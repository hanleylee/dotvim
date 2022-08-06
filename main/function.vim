" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" vim 进入时的判断
func! Enter()
        if !g:is_in_gui " 终端运行且没有参数
            " exec 'Startify'
    if argc() == 0
        elseif g:is_in_gui " gui 运行且没有参数
            " exec 'NERDTree' . '$HKMS' | wincmd p | exec 'Startify'
            cd $HKMS
        endif
    else
        " do nothing
    endif
endfunc

func! MapMetaCode(key)
    exec "set <M-" . a:key . ">=\e" . a:key
endfunc
