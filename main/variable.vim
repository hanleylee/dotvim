" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" let $VIM_CONFIG=expand('$HOME/.vim')
let $HKMS=expand('$HOME/repo/hkms')
let $HANLEY_VIMS=expand('$HOME/.vim/hanleylee')
let g:snips_author = 'Hanley Lee'
let g:hl_rootmarkers = split($ROOTMARKERS_STR, ' ')

let g:is_in_macvim_gui = has('gui_macvim') && has('gui_running') " 位于 macvim 的gui 模式下
let g:is_in_gui = empty($TERM) || g:is_in_macvim_gui
let g:is_in_term = !g:is_in_gui " 位于终端中
let g:is_in_iterm = $TERM_PROGRAM ==? 'iTerm.app'
let g:is_in_apple_term = $TERM_PROGRAM ==? 'Apple_Terminal'
let g:is_in_kitty = $TERM ==? 'xterm-kitty'
let g:is_in_vim = !has('nvim') " 位于 vim 中
let g:is_in_nvim = has('nvim') " 位于 neovim 中
let g:is_win = (has('win32') || has('win64')) ? v:true : v:false
let g:is_linux = (has('unix') && !has('macunix')) ? v:true : v:false
let g:is_mac = has('macunix') ? v:true : v:false
let g:is_work = match(hostname(), 'work') != -1
let g:is_home = match(hostname(), 'home') != -1
let g:is_hanley = match(hostname(), 'hanley') != -1

let g:skipview_files = [
            \ '[EXAMPLE PLUGIN BUFFER]'
            \ ]

if has('nvim')
    lua vim.g["system_name"] = vim.loop.os_uname().sysname
else
    if has('win32')
        let g:system_name = 'Windows_NT'
    elseif has('macunix')
        let g:system_name = 'Darwin'
    else
        let g:system_name = 'Linux'
    endif
endif

let g:filetype_extension_dic = {
            \ 'abap': '.abap',
            \ 'antlr': '.g4',
            \ 'asp': '.asp',
            \ 'ats': '.dats',
            \ 'actionscript': '.as',
            \ 'ada': '.adb',
            \ 'agda': '.agda',
            \ 'apacheconf': '.apacheconf',
            \ 'apex': '.cls',
            \ 'applescript': '.applescript',
            \ 'arc': '.arc',
            \ 'arduino': '.ino',
            \ 'asciidoc': '.asciidoc',
            \ 'asciiart': '.asciiart',
            \ 'assembly': '.asm',
            \ 'augeas': '.aug',
            \ 'autohotkey': '.ahk',
            \ 'autoit': '.au3',
            \ 'awk': '.awk',
            \ 'batchfile': '.bat',
            \ 'befunge': '.befunge',
            \ 'blitzbasic': '.bb',
            \ 'blitzmax': '.bmx',
            \ 'bluespec': '.bsv',
            \ 'boo': '.boo',
            \ 'brainfuck': '.b',
            \ 'brightscript': '.brs',
            \ 'bro': '.bro',
            \ 'c': '.c',
            \ 'c++': '.cpp',
            \ 'cpp': '.cpp',
            \ 'clips': '.clp',
            \ 'cmake': '.cmake',
            \ 'cobol': '.cob',
            \ 'css': '.css',
            \ 'ceylon': '.ceylon',
            \ 'chuck': '.ck',
            \ 'cirru': '.cirru',
            \ 'clean': '.icl',
            \ 'clojure': '.clj',
            \ 'coffeescript': '.coffee',
            \ 'coldfusion': '.cfm',
            \ 'coq': '.coq',
            \ 'creole': '.creole',
            \ 'crystal': '.cr',
            \ 'cucumber': '.feature',
            \ 'cuda': '.cu',
            \ 'cython': '.pyx',
            \ 'd': '.d',
            \ 'dm': '.dm',
            \ 'dot': '.dot',
            \ 'dart': '.dart',
            \ 'diff': '.diff',
            \ 'dylan': '.dylan',
            \ 'ecl': '.ecl',
            \ 'eiffel': '.e',
            \ 'elixir': '.ex',
            \ 'elm': '.elm',
            \ 'erlang': '.erl',
            \ 'flux': '.fx',
            \ 'fortran': '.f90',
            \ 'factor': '.factor',
            \ 'fancy': '.fy',
            \ 'fantom': '.fan',
            \ 'forth': '.fth',
            \ 'gas': '.s',
            \ 'glsl': '.glsl',
            \ 'genshi': '.kid',
            \ 'glyph': '.glf',
            \ 'go': '.go',
            \ 'gosu': '.gs',
            \ 'groff': '.man',
            \ 'groovy': '.groovy',
            \ 'html': '.html',
            \ 'http': '.http',
            \ 'haml': '.haml',
            \ 'handlebars': '.handlebars',
            \ 'harbour': '.hb',
            \ 'haskell': '.hs',
            \ 'haxe': '.hx',
            \ 'hy': '.hy',
            \ 'idl': '.pro',
            \ 'ini': '.ini',
            \ 'idris': '.idr',
            \ 'io': '.io',
            \ 'ioke': '.ik',
            \ 'j': '.ijs',
            \ 'json': '.json',
            \ 'json5': '.json5',
            \ 'jsonld': '.jsonld',
            \ 'jade': '.jade',
            \ 'java': '.java',
            \ 'javascript': '.js',
            \ 'julia': '.jl',
            \ 'krl': '.krl',
            \ 'kotlin': '.kt',
            \ 'lfe': '.lfe',
            \ 'llvm': '.ll',
            \ 'lasso': '.lasso',
            \ 'less': '.less',
            \ 'lilypond': '.ly',
            \ 'livescript': '.ls',
            \ 'logos': '.xm',
            \ 'logtalk': '.lgt',
            \ 'lua': '.lua',
            \ 'm': '.mumps',
            \ 'makefile': '.mak',
            \ 'mako': '.mako',
            \ 'markdown': '.md',
            \ 'mask': '.mask',
            \ 'matlab': '.matlab',
            \ 'max': '.maxpat',
            \ 'mediawiki': '.mediawiki',
            \ 'mirah': '.druby',
            \ 'monkey': '.monkey',
            \ 'moocode': '.moo',
            \ 'moonscript': '.moon',
            \ 'myghty': '.myt',
            \ 'nsis': '.nsi',
            \ 'nemerle': '.n',
            \ 'netlogo': '.nlogo',
            \ 'nginx': '.nginxconf',
            \ 'nimrod': '.nim',
            \ 'nu': '.nu',
            \ 'numpy': '.numpy',
            \ 'ocaml': '.ml',
            \ 'objdump': '.objdump',
            \ 'omgrofl': '.omgrofl',
            \ 'opa': '.opa',
            \ 'opencl': '.cl',
            \ 'org': '.org',
            \ 'oxygene': '.oxygene',
            \ 'pawn': '.pwn',
            \ 'php': '.php',
            \ 'parrot': '.parrot',
            \ 'pascal': '.pas',
            \ 'perl': '.pl',
            \ 'perl6': '.p6',
            \ 'pike': '.pike',
            \ 'pod': '.pod',
            \ 'pogoscript': '.pogo',
            \ 'postscript': '.ps',
            \ 'powershell': '.ps1',
            \ 'processing': '.pde',
            \ 'prolog': '.prolog',
            \ 'puppet': '.pp',
            \ 'python': '.py',
            \ 'qml': '.qml',
            \ 'r': '.r',
            \ 'rdoc': '.rdoc',
            \ 'realbasic': '.rbbas',
            \ 'rhtml': '.rhtml',
            \ 'rmarkdown': '.rmd',
            \ 'racket': '.rkt',
            \ 'rebol': '.rebol',
            \ 'redcode': '.cw',
            \ 'robotframework': '.robot',
            \ 'rouge': '.rg',
            \ 'ruby': '.rb',
            \ 'rust': '.rs',
            \ 'scss': '.scss',
            \ 'sql': '.sql',
            \ 'sage': '.sage',
            \ 'sass': '.sass',
            \ 'scala': '.scala',
            \ 'scaml': '.scaml',
            \ 'scheme': '.scm',
            \ 'scilab': '.sci',
            \ 'self': '.self',
            \ 'shell': '.sh',
            \ 'shen': '.shen',
            \ 'slash': '.sl',
            \ 'smalltalk': '.st',
            \ 'smarty': '.tpl',
            \ 'squirrel': '.nut',
            \ 'stylus': '.styl',
            \ 'supercollider': '.scd',
            \ 'toml': '.toml',
            \ 'txl': '.txl',
            \ 'tcl': '.tcl',
            \ 'tcsh': '.tcsh',
            \ 'tex': '.tex',
            \ 'tea': '.tea',
            \ 'textile': '.textile',
            \ 'turing': '.t',
            \ 'twig': '.twig',
            \ 'typescript': '.ts',
            \ 'unrealscript': '.uc',
            \ 'vhdl': '.vhdl',
            \ 'vala': '.vala',
            \ 'verilog': '.v',
            \ 'viml': '.vim',
            \ 'volt': '.volt',
            \ 'xc': '.xc',
            \ 'xml': '.xml',
            \ 'xproc': '.xpl',
            \ 'xquery': '.xquery',
            \ 'xs': '.xs',
            \ 'xslt': '.xslt',
            \ 'xtend': '.xtend',
            \ 'yaml': '.yml',
            \ 'ec': '.ec',
            \ 'edn': '.edn',
            \ 'fish': '.fish',
            \ 'mupad': '.mu',
            \ 'nesc': '.nc',
            \ 'ooc': '.ooc',
            \ 'restructuredtext': '.rst',
            \ 'wisp': '.wisp',
            \ 'xbase': '.prg',
            \ }

