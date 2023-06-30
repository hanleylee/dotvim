" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

if !hl#plug_loaded('fern.vim')
    finish
endif

let g:fern_disable_startup_warnings = 1
let g:fern#disable_default_mappings = 1
let g:fern#renderer#default#leading = '   '
let g:fern#renderer#default#root_symbol = '┬ '
let g:fern#renderer#default#leaf_symbol = '├─ '
let g:fern#renderer#default#collapsed_symbol = '├─ '
let g:fern#renderer#default#expanded_symbol = '├┬ '
let g:fern#mark_symbol = '*'

let g:fern#profile = 0
let g:fern#logfile = v:null
" let g:fern#loglevel = g:fern#ERROR
let g:fern#opener = 'edit'
let g:fern#hide_cursor = 1
let g:fern#keepalt_on_edit = 0
let g:fern#keepjumps_on_edit = 0

let g:fern#disable_viewer_spinner = 0
let g:fern#disable_viewer_auto_duplication = 0
let g:fern#disable_drawer_auto_winfixwidth = 0
let g:fern#disable_drawer_auto_resize = 0
let g:fern#disable_drawer_smart_quit = 0
let g:fern#disable_drawer_auto_restore_focus = 0
let g:fern#default_hidden = 1
let g:fern#default_include = '' " A default |String| pattern used to filter nodes (include).
let g:fern#default_exclude = '' " A default |String| pattern used to filter nodes (exclude).
" let g:fern#renderer = 'default'
let g:fern#comparator = 'default' " A |String| name of comparator used to sort tree items. Allowed value
let g:fern#drawer_width = 50 " A |Number| width of drawer in default.
let g:fern#drawer_keep = v:false
let g:fern#scheme#file#show_absolute_path_on_root_label = 1
let g:fern#disable_auto_buffer_delete = 0
let g:fern#disable_auto_buffer_rename = 0

