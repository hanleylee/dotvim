" Author: Hanley Lee
" Website: https://www.hanleylee.com
" GitHub: https://github.com/hanleylee
" License:  MIT License

" get path until directory
func! hl#fs#getOnlyDirectory()
    " if &filetype ==# 'netrw'
    "     return getcwd()
    " else
    return resolve(expand('%:p:h'))
    " endif
endfunc

" get only file name
func! hl#fs#getOnlyFileName()
    if &filetype ==# 'netrw'
        return ''
    else
        return resolve(expand('%:t'))
    endif
endfunc

" get full path
func! hl#fs#getFullPathName()
    return resolve(expand('%:p'))
endfunction

func! hl#fs#getDirs(dir)
    if empty(a:dir)
        let a:dir = hl#fs#getOnlyDirectory()
    endif
    let expanded_dir = expand(a:dir)
    let directories=glob(fnameescape(expanded_dir).'/{,.}*/', 1, 1)
    call map(directories, 'fnamemodify(v:val, ":p:h")')
    return directories
endfunction

function! hl#fs#resolveFilePath(relative_path)
    " 1. Expand environment variables in the path
    let expanded_path = expand(a:relative_path)

    " 2. Check if the expanded path is an absolute path
    if !empty(expanded_path) && (expanded_path[0] ==# '/' || expanded_path[0] ==# '\\')
        return fnamemodify(expanded_path, ':p')  " Return the absolute path directly
    endif

    " 3. Resolve relative to the current file's directory
    let current_file_dir = fnamemodify(expand('%:p:h'), ':p')
    let candidate1 = fnamemodify(current_file_dir . '/' . expanded_path, ':p')
    if filereadable(candidate1)
        return candidate1
    endif

    " 4. Resolve relative to the current working directory
    let candidate2 = fnamemodify(expanded_path, ':p')
    if filereadable(candidate2)
        return candidate2
    endif

    " 5. Search in the directories specified by the 'path' option
    for dir in split(&path, ',')
        if dir ==# '.'
            let dir = current_file_dir
        elseif dir ==# ''
            continue
        endif

        " Handle "**" for recursive search
        if dir =~ '\*\*'
            let glob_pattern = fnamemodify(dir, ':h') . '/**/' . expanded_path
            let matches = glob(glob_pattern, 0, 1)  " Find recursively
            if !empty(matches)
                return matches[0]  " Return the first match
            endif
        else
            let candidate3 = fnamemodify(dir . '/' . expanded_path, ':p')
            if filereadable(candidate3)
                return candidate3
            endif
        endif
    endfor

    echom 'no file found in resolveFilePath'
    " 6. If not found, return the unresolved path with an error
    return ''
endfunction

" 判断当前缓冲区是否视为「大文件」（行数、当前行宽或磁盘占用超过阈值）。
function! hl#fs#isLargeFile() abort
    let max_line = get(g:, 'large_file_line', 50000)
    let max_column = get(g:, 'large_file_column', 100000)
    let max_size = get(g:, 'large_file_size', 5 * 1024 * 1024)

    let total_line = line('$')
    let total_column = col('$')
    let file_size = getfsize(expand('%'))

    if total_line > max_line
        return 1
    endif
    if total_column > max_column
        return 1
    endif
    if file_size == -2 || file_size > max_size
        return 1
    endif
    return 0
endfunction

" 刷新当前缓冲区大文件状态缓存。
function! hl#fs#refresh_large_file_flag() abort
    let b:hl_is_large_file = hl#fs#isLargeFile()
    return b:hl_is_large_file
endfunction

" 读取当前缓冲区大文件状态缓存，不存在时自动计算。
function! hl#fs#is_large_file_cached() abort
    if !exists('b:hl_is_large_file')
        return hl#fs#refresh_large_file_flag()
    endif
    return b:hl_is_large_file
endfunction

" 按大文件状态调整当前缓冲区：大文件关闭 backup / swap / 持久化 undo，否则恢复为全局默认。
function! hl#fs#disable_backup_swap_undo_for_large_file() abort
    if hl#fs#is_large_file_cached()
        setlocal nobackup nowritebackup noswapfile noundofile
    else
        setlocal backup< writebackup< swapfile< undofile<
    endif
endfunction

" 统一应用大文件策略（刷新缓存并应用 buffer 级选项）。
function! hl#fs#apply_large_file_policy() abort
    call hl#fs#refresh_large_file_flag()
    call hl#fs#disable_backup_swap_undo_for_large_file()
endfunction
