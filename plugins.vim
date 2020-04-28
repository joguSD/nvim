" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'christoomey/vim-tmux-navigator' " Tmux navigation integration
Plug 'ervandew/supertab'              " make tab do more
Plug 'mileszs/ack.vim'                " ag search
Plug 'kien/ctrlp.vim'                 " file search
Plug 'itchyny/lightline.vim'          " statusbar
Plug 'tpope/vim-fugitive'             " git integration
Plug 'tpope/vim-rhubarb'              " Gbrowse dep
Plug 'airblade/vim-gitgutter'         " git gutter
Plug 'sheerun/vim-polyglot'           " highlight everything
Plug 'natebosch/vim-lsc'              " Lightweight language server client
Plug 'ajh17/VimCompletesMe'           " Minimal tab completion
Plug 'ntpeters/vim-better-whitespace',
            \ {'on_cmd': 'StripWhitespace'}    " Whitespace plugin

" Initialize plugin system
call plug#end()
