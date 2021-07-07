" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

function! hl#format_CN()
    retab
    %substitute /，/, /g
    %substitute /。/. /g
    %substitute /：/: /g
    %substitute /？/? /g
    %substitute /；/; /g
    %substitute /“\|”/"/g
    %substitute /、/, /g
    %substitute /（/(/g
    %substitute /）/)/g
    %substitute /！/!/g
    %substitute /「/ **/g
    %substitute /」/** /g
    %substitute /[ ]*\(`[^`]\+`\)[ ]*/ \1 /g " 为 `content` 添加左右两侧空格
    %substitute /\s\+\([!;,.:?]\)/\1/g " 清除标点前的空格
    %substitute /^ `/`/g " 清除行首的空格
    %substitute/\([\u4e00-\u9fa5\u3040-\u30FF]\)\([a-zA-Z0-9@&=\[\$\%\^\-\+(\/\\]\)/\1 \2/g " 汉字在前, 英文/数字在后, 中间添加空格
    %substitute/\([a-zA-Z0-9!&;=\]\,\.\:\?\$\%\^\-\+\)\/\\]\)\([\u4e00-\u9fa5\u3040-\u30FF]\)/\1 \2/g " 汉字在后, 英文/数字在前, 中间添加空格
    %substitute /\s\+\n/\r/g " 清除尾部空格
endfunction

function! hl#format_objectmapper()
    retab!
    %s /\/\/.*\n//ge
    %s /^.* \(.*\):.*/    \1 <- map["\1"]/ge
endfunction

" 目的: 用于将 markdown 文件复制到外界
" 作用: 将markdown 的多行在不影响布局的情况下合并为一段话
function! hl#merge_md()
    %s /\([\.\,]$\)\n\(\S\)/\1 \2/g
endfunction

function! hl#GrepOperator(type)
    let saved_unnamed_register = @@
    if a:type ==# 'v'
        execute "normal! `<v`>y"
    elseif a:type ==# 'char'
        execute "normal! `[v`]y"
    else
        return
    endif

    silent execute "grep! -R " . shellescape(@@) . " ."
    copen
    let @@ = saved_unnamed_register
endfunction

function! hl#AsyncTask(mode)
    w | execute "AsyncTask! " . a:mode
endfunction
