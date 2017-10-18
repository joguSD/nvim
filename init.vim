"Python setup
let g:python_host_prog  = $HOME . '/.pyenv/versions/nvim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/nvim3/bin/python'
" Dein setup
if &compatible
    set nocompatible
endif
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundle')
    call dein#begin('~/.vim/bundle')

    call dein#add('Shougo/dein.vim')                " plugin manager
    call dein#add('ervandew/supertab')              " make tab do more
    call dein#add('mileszs/ack.vim')                " ag search
    call dein#add('w0rp/ale')                       " async linting
    call dein#add('itchyny/lightline.vim')          " statusbar
    call dein#add('tpope/vim-fugitive')             " git integration
    call dein#add('tpope/vim-rhubarb')              " Gbrowse dep
    call dein#add('airblade/vim-gitgutter')         " git gutter
    call dein#add('sheerun/vim-polyglot')           " highlight everything
    call dein#add('davidhalter/jedi-vim',
                \ {'on_ft': 'Python'})              " python completion
    call dein#add('ntpeters/vim-better-whitespace',
                \ {'on_cmd': 'StripWhitespace'})    " Whitespace plugin


    call dein#end()
    call dein#save_state()
endif
" auto update
if dein#check_install()
    call dein#install()
endif
" end dein
let mapleader=","
" Reverse supertab scroll order
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1
" use ag
let g:ackprg = 'ag --vimgrep'
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '▲'
let g:ale_sign_column_always = 1
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

autocmd User ALELint call s:MaybeUpdateLightline()

" Update and show lightline but only if it's visible (e.g., not in Goyo)
function! s:MaybeUpdateLightline()
    if exists('#lightline')
        call lightline#update()
    end
endfunction

" Core vim customizations
filetype plugin indent on
syntax enable
colorscheme redplanet
set backspace=2
set mouse=a            " mouse mode
set noeb vb t_vb=      " Fix scroll freezing
set shiftwidth=4       " Indent 4 instead of 8
"set wildchar=<Tab>     " Character that starts the auto-completion
set tabstop=4          " Tab stop is 4 instead of 8
set expandtab          " Tabs are extended into spaces
set number
set list
set completeopt-=preview
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
