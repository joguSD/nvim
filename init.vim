" DEIN INIT START -------------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('~/.vim/bundle')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" MY PLUGINS
call dein#add('Shougo/deoplete.nvim')                       " Autocompletion
call dein#add('kien/ctrlp.vim')                             " Fuzzy Search
call dein#add('tpope/vim-fugitive')                         " Git wrapper
call dein#add('bling/vim-airline')                          " Status bar
call dein#add('joguSD/vim-airline-themes')                  " Status bar themes
call dein#add('eagletmt/neco-ghc', {'on_ft': 'haskell'})    " Haskell complete
call dein#add('rust-lang/rust.vim', {'on_ft': 'rust'})      " Rust support
call dein#add('sebastianmarkow/deoplete-rust',
			\ {'on_ft': 'rust'})                            " Rust complete
call dein#add('zchee/deoplete-jedi', {'on_ft': 'python'})   " Python complete
call dein#add('ntpeters/vim-better-whitespace',
			\ {'on_cmd': 'StripWhitespace'})                " Whitespace plugin
call dein#add('godlygeek/tabular')                          " Tabularize text
call dein#add('ervandew/supertab')                          " Make tab do more
call dein#add('scrooloose/nerdtree',
			\ {'on_cmd': 'NERDTreeToggle'})                 " File browser
call dein#add('mhinz/vim-startify')                         " Start screen
" DEIN INIT END -------------
" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif
" Deoplete for rust
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#rust#racer_binary = '/Users/Jordan/.cargo/bin/racer'
let g:deoplete#sources#rust#rust_source_path = '/Users/Jordan/rustc-1.11.0/src'
" Reverse supertab scroll order
let g:SuperTabDefaultCompletionType = "<c-n>"
" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Airline config
let g:airline_theme = 'jogu'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
if &diff
    let g:airline#extensions#whitespace#enabled = 0
endif
"Python setup
let g:python_host_prog = '/usr/bin/python'
" General configuration
syntax on              " Syntax Highlighting on
set timeoutlen=1000    " Reduce timout to be more responsive
set ttimeoutlen=0      " Reduce timout to be more responsive
set noautoread         " Changing code in another window maintains two versions
set backspace=2        " Allows backspace of indent, eol, and start
set confirm            " Starts dialog when exiting without saving
set title              " filename [+=-] (path) - GVIM
set showmatch          " Show match when inserting {}, [], or ()'s
set showmode           " Display the current mode on the last line
set visualbell         " Screen flash instead of annoying beeping
set noeb vb t_vb=      " Fix scroll freezing
set autowrite          " Automatically save before commands like :next/:make
set nobackup           " Do not make a backup before overwriting
set formatoptions=tcrq " How to autoindent
set nogdefault         " Controls how the search and replace command is used
set helpheight=40      " Numbers of row the help window will have when opened
set history=20         " Stores the last 20 ':' commands
set noincsearch        " Does not go immediately to pattern typed so far
set nolist             " Tabs are not shown as <TABS> and EOL as <EOL>
set matchtime=2        " Tenths of seconds to show matching pairs
set mousehide          " Hides the mouse pointer when typing characters
set ruler              " Always show position in file
set scrolloff=12       " Number of lines to keep around cursor
set shiftround         " Rounds < & > command to the nearest mod of shiftwidth
set shiftwidth=4       " Indent 4 instead of 8
set tabstop=4          " Tab stop is 4 instead of 8
set expandtab          " Tabs are extended into spaces
set smartindent        " Next line indentation is based on previous line
set splitbelow         " Extra window open below the current window
set noswapfile         " No intermidiate files are used when saving
set textwidth=80       " I do not like going all the way to the edge
set undolevels=100     " The commands that can be stored in for undo
set virtualedit=all    " Cursor can go beyond the end of a line
set wrapmargin=2       " Word wraps 2 character spaces from the margin
set wildchar=<Tab>     " Character that starts the autocompletion
set wildmenu           " Shows a list of possible autocompletions
set wildmode=list      " show list and complete the first match
set nowritebackup      " No intermidate files when saving
set number             " Show Line Numbers
set laststatus=2       " Always display the status line
set showmatch          " Show matching braces
set cin                " Enable C-style indenation
set si                 " Enable smart indenation
"Custom configurations
colorscheme redplanet
" Haskell completion detailed listings
let g:necoghc_enable_detailed_browse = 1
" Disable autocompletion max width
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
" Ignore files while auto completing
set wildignore=*.o,*.bak,*.data,*.class
"For diff mode auto resize vertical splits
au VimResized ?* if &diff | wincmd = | endif
"Restore cursor position
set viminfo='10,\"100,:20,%,n~/.viminfo
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END
" Do not expand tabs in assembly file.  Make them 8 chars wide.
au BufRead,BufNewFile *.s set noexpandtab
au BufRead,BufNewFile *.s set shiftwidth=8
au BufRead,BufNewFile *.s set tabstop=8
"Highlight 81st character
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
" Auto save/load folds
au BufWinLeave ?*.* mkview
au BufWinEnter ?*.* silent! loadview

" KEYBINDINGS
" Bind tab to move focus
nnoremap <tab> <C-w><C-w>
