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
\        ['linter_checking', 'linter_warnings', 'linter_errors', 'linter_ok']
\    ]
\ },
\ 'component_function': {
\    'gitbranch': 'fugitive#head'
\ },
\ 'component_expand': {
\    'linter_checking': 'lightline#ale#checking',
\    'linter_warnings': 'lightline#ale#warnings',
\    'linter_errors': 'lightline#ale#errors',
\    'linter_ok': 'lightline#ale#ok',
\ },
\ 'component_type': {
\    'linter_warnings': 'warning',
\    'linter_errors': 'error',
\    'linter_ok': 'ok',
\    'readonly': 'error',
\ },
\}

let g:lightline#ale#indicator_checking = '...'
let g:lightline#ale#indicator_warnings = '▲ '
let g:lightline#ale#indicator_errors = '✗ '
let g:lightline#ale#indicator_ok = '✓'

