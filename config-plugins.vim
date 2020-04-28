" Use ripgrep for filename and content searching
if executable('rg')
    let g:ctrlp_user_command = 'rg --files %s'
    let g:ctrlp_use_caching = 0
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_switch_buffer = 'et'
    let g:ackprg = 'rg --vimgrep --no-heading'
endif

" Lightline config
runtime lightline.vim

" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2


" LSC configuration
" TODO: rust-analyzer
let g:lsc_server_commands = {
 \  'python': {
 \    'command': 'pyls',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  }
 \}
let g:lsc_auto_map = v:true
let g:lsc_enable_diagnostics = v:false
" IDK what all this does but it was suggested
set completeopt=menu,menuone,noinsert,noselect
