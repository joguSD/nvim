-- Set python paths to setup virtual-envs
local home = os.getenv('HOME')
vim.g.python3_host_prog = home .. '/.venvs/nvim3/bin/python'
vim.g.python_host_prog = home .. '/.venvs/nvim2/bin/python'

require('core')
require('plugins')
require('config-plugins')
