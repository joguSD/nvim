-- Core vim customizations
vim.g.mapleader = ','
vim.cmd('filetype plugin indent on')
vim.cmd('syntax enable')
vim.cmd('colorscheme nord')
-- Highlight at 80
-- vim.cmd('highlight ColorColumn ctermbg=magenta')
-- vim.cmd("call matchadd('ColorColumn', '\\%81v', 100)")

vim.opt.shiftwidth = 4         -- Indent 4 instead of 8
vim.opt.tabstop = 4            -- Tab stop is 4 instead of 8
vim.opt.expandtab = true       -- Tabs are extended into spaces
vim.opt.foldenable = false     -- disable folding
vim.opt.number = true
vim.opt.list = true
vim.opt.wrap = false
vim.opt.signcolumn = 'yes'     -- Always show sign column
vim.opt.errorbells = false     -- Fix Scroll freezing
vim.opt.visualbell = true      -- Fix Scroll freezing
vim.opt.hlsearch = false       -- Disable highlight after search
vim.opt.termguicolors = true
