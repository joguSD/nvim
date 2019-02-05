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
