" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

command! -range=% -nargs=0 FormatCN let b:view = winsaveview() | silent! <line1>,<line2> call hl#Format_CN() | call winrestview(b:view)
" command! -range=% -nargs=0 FormatCN silent! <line1>,<line2> call hl#Format_CN()
command! FormatObjectMapper silent! call hl#format_objectmapper()
command! -range FormatSurgeRule '<,'> call hl#format_surge_rule()
command! MergeMD silent! call hl#merge_md()
command! CDF silent call CDF()
command! OFD silent call OFD()
command! TrimWhitespace call TrimWhitespace()
command! -nargs=0 PlugBrowse silent call PlugBrowse()
command! UnescapeJSON silent! call UnescapeJSON()
command! EscapeJSON silent! call EscapeJSON()
