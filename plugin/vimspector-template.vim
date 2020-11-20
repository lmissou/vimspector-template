" A plugin to generate vimspector config file and some vimspector snippets

let s:root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

function! VimspectorTempWrite()
    echom s:root_dir
    exec '0read ' . s:root_dir . '/template.json'
endfunction

" Create a init config file in project root path(use arg named 'filepath')
function! VimspectorTempInit(filepath)
    let s:template_file_name = fnamemodify(a:filepath . '.vimspector.json', ':h')
    exec 'edit ' . s:template_file_name . '/.vimspector.json'
endfunction

command! -nargs=1 -complete=file VimspectorTempInit call VimspectorTempInit(<f-args>)

augroup VIMSPECTOR_TEMPLATE
    autocmd!
    autocmd BufNewFile .vimspector.json call VimspectorTempWrite()
augroup END


