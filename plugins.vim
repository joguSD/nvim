" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator' " Tmux navigation integration
Plug 'ervandew/supertab'              " make tab do more
Plug 'mileszs/ack.vim'                " ag search
Plug 'kien/ctrlp.vim'                 " file search
Plug 'w0rp/ale'                       " async linting
Plug 'itchyny/lightline.vim'          " statusbar
Plug 'maximbaz/lightline-ale'         " Ale integration for lightline
Plug 'tpope/vim-fugitive'             " git integration
Plug 'tpope/vim-rhubarb'              " Gbrowse dep
Plug 'airblade/vim-gitgutter'         " git gutter
Plug 'sheerun/vim-polyglot'           " highlight everything
"Plug 'Shougo/deoplete.nvim'           " autocompetion
"Plug 'zchee/deoplete-jedi', {'on_ft': 'python'}
Plug 'ntpeters/vim-better-whitespace',
            \ {'on_cmd': 'StripWhitespace'}    " Whitespace plugin

" Initialize plugin system
call plug#end()
