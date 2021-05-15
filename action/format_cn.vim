retab!
%substitute /，/, /ge
%substitute /。/. /ge
%substitute /：/: /ge
%substitute /？/? /ge
%substitute /；/; /ge
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
