" Dein setup
if &compatible
    set nocompatible
endif
set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundle')
    call dein#begin('~/.vim/bundle')

    call dein#add('Shougo/dein.vim')                " plugin manager
    call dein#add('christoomey/vim-tmux-navigator') " plugin manager
    call dein#add('ervandew/supertab')              " make tab do more
    call dein#add('mileszs/ack.vim')                " ag search
    call dein#add('kien/ctrlp.vim')                 " file search
    call dein#add('w0rp/ale')                       " async linting
    call dein#add('itchyny/lightline.vim')          " statusbar
    call dein#add('tpope/vim-fugitive')             " git integration
    call dein#add('tpope/vim-rhubarb')              " Gbrowse dep
    call dein#add('airblade/vim-gitgutter')         " git gutter
    call dein#add('sheerun/vim-polyglot')           " highlight everything
    call dein#add('Shougo/deoplete.nvim')           " autocompetion
    call dein#add('zchee/deoplete-jedi', {'on_ft': 'python'})
    call dein#add('davidhalter/jedi-vim', {'on_ft': 'python'})
    call dein#add('ntpeters/vim-better-whitespace',
                \ {'on_cmd': 'StripWhitespace'})    " Whitespace plugin


    call dein#end()
    call dein#save_state()
endif

" Auto update plugins if needed
if dein#check_install()
    call dein#install()
endif

" Configure plugins

" Use deoplete on startup for completion
let g:deoplete#enable_at_startup = 1
" Disable jedi autocompletion
let g:jedi#completions_enabled = 0

" Reverse supertab scroll order
let g:SuperTabDefaultCompletionType = "<c-n>"

" Use ripgrep for filename and content searching
if executable('rg')
    let g:ctrlp_user_command = 'rg --files %s'
    let g:ctrlp_use_caching = 0
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_switch_buffer = 'et'
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

" ALE linting config
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '▲'
let g:ale_sign_column_always = 1

" Lightline config
runtime lightline.vim

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
