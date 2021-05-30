local home = os.getenv('HOME')
-- Set python paths to setup virtual-envs
vim.g.python3_host_prog = home .. '/.venvs/nvim3/bin/python'
vim.g.python_host_prog = home .. '/.venvs/nvim2/bin/python'

-- Load plugin manager and plugins
require('plugins')

-- Configure plugins
require('plugins-config')

-- Core vim customizations
vim.g.mapleader = ','
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')
vim.cmd('colorscheme redplanet')
-- Highlight at 80
-- vim.cmd('highlight ColorColumn ctermbg=magenta')
-- vim.cmd("call matchadd('ColorColumn', '\\%81v', 100)")


-- TODO: Remove this in favor of vim.opt
-- This is a bug and shouldn't be needed in the future see the following PR:
-- https://github.com/neovim/neovim/pull/13479
local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

local function opt(scope, key, value)
  scopes[scope][key] = value
  if scope ~= 'o' then scopes['o'][key] = value end
end

opt('b', 'shiftwidth', 4)     -- Indent 4 instead of 8
opt('b', 'tabstop', 4)        -- Tab stop is 4 instead of 8
opt('b', 'expandtab', true)   -- Tabs are extended into spaces
opt('w', 'foldenable', false) -- disable folding
opt('w', 'number', true)
opt('w', 'list', true)
-- Fix Scroll freezing
opt('o', 'errorbells', false)
opt('o', 'visualbell', true)
