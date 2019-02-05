" Set python paths to setup virtual-envs
let g:python_host_prog  = $HOME . '/.pyenv/versions/nvim2/bin/python'
let g:python3_host_prog = $HOME . '/.pyenv/versions/nvim3/bin/python'

" Load plugin manager and plugins
runtime plugins.vim

" Core vim customizations
let mapleader=","
filetype plugin indent on
syntax enable
colorscheme redplanet
set backspace=2
set noeb vb t_vb=      " Fix scroll freezing
set shiftwidth=4       " Indent 4 instead of 8
set tabstop=4          " Tab stop is 4 instead of 8
set expandtab          " Tabs are extended into spaces
set number
set list
set completeopt-=preview
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
