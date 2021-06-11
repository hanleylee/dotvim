" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/HanleyLee
" License:  MIT License

retab!

%s /\/\/.*\n//ge
%s /^.* \(.*\):.*/    \1 <- map["\1"]/ge
