local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'christoomey/vim-tmux-navigator' -- Tmux navigation integration
  use 'itchyny/lightline.vim'          -- statusbar
  use 'tpope/vim-fugitive'             -- git integration
  use 'tpope/vim-rhubarb'              -- Gbrowse dep
  use 'sheerun/vim-polyglot'           -- highlight everything
  use {'ntpeters/vim-better-whitespace', cmd = 'StripWhitespace'}

  -- 0.5.0 nightly stuff
  use 'neovim/nvim-lspconfig'
  use 'nvim-treesitter/nvim-treesitter'
  use 'hrsh7th/nvim-compe'             -- LSP Autocompletion
  use 'kosayoda/nvim-lightbulb'        -- Show a lightbulb for lsp actions
  -- Telescope
  use 'nvim-lua/popup.nvim'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'  -- Search plugin
  -- Requires plenary
  use 'lewis6991/gitsigns.nvim'
  use 'arcticicestudio/nord-vim'       -- Nord colorscheme, no treesitter
  use 'nvim-treesitter/playground'
  -- Debugging support
  use 'mfussenegger/nvim-dap'
end)
