-- Enable tree sitter
local ts = require 'nvim-treesitter.configs'
ts.setup {ensure_installed = 'maintained', highlight = {enable = true}}

-- Use ripgrep if available
local has_rg = vim.api.nvim_eval('executable("rg")')
if has_rg == 1 then
    vim.g.ctrlp_user_command = 'rg --files %s'
    vim.g.ctrlp_use_caching = 0
    vim.g.ctrlp_working_path_mode = 'ra'
    vim.g.ctrlp_switch_buffer = 'et'
    vim.g.ackprg = 'rg --vimgrep --no-heading'
end

require('lightline-config')
require('compe-config')
require('lsp-config')
require('dap-config')

require('gitsigns').setup() -- Enable git gutter signs

-- Write all buffers before navigating from Vim to tmux pane
vim.g.tmux_navigator_save_on_switch = 2


-- Show lightbulb for available lsp actions
vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]
