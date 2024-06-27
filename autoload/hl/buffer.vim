" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License


function! hl#buffer#GetBuffersByEditTime()
    " 获取所有缓冲区信息
    let buffers = []
    let bufnrs = filter(range(1, bufnr('$')), 'buflisted(v:val) && getbufvar(v:val, "&filetype") != "qf"')
    let bufinfo = map(bufnrs, 'getbufinfo(v:val)[0]')

    " 排序缓冲区，根据 buffer 的最后编辑时间, 最近修改的排第一
    call sort(bufinfo, {a, b -> b.lastused - a.lastused})

    " 构造结果字符串
    for buf in bufinfo
        call add(buffers, buf.bufnr)
    endfor

    return buffers
endfunction

function! hl#buffer#frontmostFilePath()
    let l:buffers = hl#buffer#GetBuffersByEditTime()
    " 初始化文件路径为空
    let l:filepath = ''

    " 遍历所有窗口
    for l:buf_id in l:buffers
        " 获取窗口的 buftype
        let l:win_buftype = getbufvar(winbufnr(l:buf_id), '&buftype')

        " 检查是否为 floaterm 类型
        if l:win_buftype == 'terminal'
            " 跳过 floaterm 窗口
            continue
        endif

        " 获取缓冲区对应的文件路径
        let l:bufname = bufname(l:buf_id)
        let l:filepath = fnamemodify(l:bufname, ':p')

        " 如果文件路径不为空，跳出循环
        if l:filepath != ''
            " 返回文件路径
            return l:filepath
        endif
    endfor

    echoerr 'invalid buffers'
    return 'invalid buffers'
endfunction
