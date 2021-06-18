" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

function! hl#format_CN()
    retab
    %substitute /，/, /ge
    %substitute /。/. /ge
    %substitute /：/: /ge
    %substitute /？/? /ge
    %substitute /；/; /ge
    %substitute /“\|”/"/ge
    %substitute /、/, /ge
    %substitute /（/(/ge
    %substitute /）/)/ge
    %substitute /！/!/ge
    %substitute /「/ **/ge
    %substitute /」/** /ge
    %substitute /\s\+\n/\r/ge
    " 汉字与其前后的英文字符、英文标点、数字间增加空白。
    %substitute/\([\u4e00-\u9fa5\u3040-\u30FF]\)\([a-zA-Z0-9@&=\[\$\%\^\-\+(\/\\]\)/\1 \2/g " 汉字在前。
    %substitute/\([a-zA-Z0-9!&;=\]\,\.\:\?\$\%\^\-\+\)\/\\]\)\([\u4e00-\u9fa5\u3040-\u30FF]\)/\1 \2/g " 汉字在后。
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
