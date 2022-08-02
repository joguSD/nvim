-- Set python paths to setup virtual-envs
local home = os.getenv('HOME')
-- vim.g.python3_host_prog = home .. '/.venvs/nvim3/bin/python'
-- vim.g.python_host_prog = home .. '/.venvs/nvim2/bin/python'

-- Load plugins first to ensure later config can rely on it
require('plugins')
require('core')
require('config-plugins')
