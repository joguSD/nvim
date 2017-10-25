" Lightline config
let g:lightline = {
\ 'colorscheme': 'seoul256',
\ 'active': {
\    'left': [
\        ['mode', 'paste'],
\        ['gitbranch', 'readonly', 'filename', 'modified']
\    ],
\    'right': [
\        ['lineinfo'],
\        ['percent'],
\        ['fileformat', 'fileencoding', 'filetype'],
\        ['linter_warnings', 'linter_errors', 'linter_ok']
\    ]
\ },
\ 'component_function': {
\    'gitbranch': 'fugitive#head'
\ },
\ 'component_expand': {
\    'linter_warnings': 'LightlineLinterWarnings',
\    'linter_errors': 'LightlineLinterErrors',
\    'linter_ok': 'LightlineLinterOK',
\ },
\ 'component_type': {
\    'readonly': 'error',
\    'linter_warnings': 'warning',
\    'linter_errors': 'error'
\ },
\}

function! LightlineLinterWarnings() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d ▲', all_non_errors)
endfunction

function! LightlineLinterErrors() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '' : printf('%d ✗', all_errors)
endfunction

function! LightlineLinterOK() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? '✓ ' : ''
endfunction

" Update lightline when ALE lints
autocmd User ALELint call s:MaybeUpdateLightline()

" Only update lightline if it's visible
function! s:MaybeUpdateLightline()
    if exists('#lightline')
        call lightline#update()
    end
endfunction
