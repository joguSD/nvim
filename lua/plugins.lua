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
  use 'mileszs/ack.vim'                -- rg search
  use 'kien/ctrlp.vim'                 -- file search
  use 'itchyny/lightline.vim'          -- statusbar
  use 'tpope/vim-fugitive'             -- git integration
  use 'tpope/vim-rhubarb'              -- Gbrowse dep
  -- use 'airblade/vim-gitgutter'         -- git gutter
  use {
      'lewis6991/gitsigns.nvim',
      requires = {
          'nvim-lua/plenary.nvim'
      }
  }
  use 'sheerun/vim-polyglot'           -- highlight everything
  use {'ntpeters/vim-better-whitespace', cmd = 'StripWhitespace'}
  use 'arcticicestudio/nord-vim'

  -- 0.5.0 nightly stuff
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'
end)
