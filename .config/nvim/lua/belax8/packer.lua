-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/nvim-lsp-installer'

  -- Completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  -- use 'hrsh7th/cmp-cmdline'

  use 'preservim/nerdtree'

  -- One Theme
  use 'rakr/vim-one'

  -- Prettier
  use 'sbdchd/neoformat'

  -- Harpoon
  use 'nvim-lua/plenary.nvim' -- Needed for Harpoon & Telescope
  use 'ThePrimeagen/harpoon'

  -- Telescope
  use 'nvim-treesitter/nvim-treesitter'
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }

  -- Git Diff in gutter
  use 'airblade/vim-gitgutter'

  -- Notifications
  use 'rcarriga/nvim-notify'

  -- Check Git blame on a line
  use 'rhysd/git-messenger.vim'

  -- Github Copilot
  use 'github/copilot.vim'

  -- Possible plugins to use
  -- use 'rcarriga/nvim-notify'  -- Notification system in neovim
  -- use 'mhinz/vim-startify'  -- Customize the nvim start screen
  -- use 'rhysd/vim-grammarous'  -- Grammer Help
  -- use 'sirver/ultisnips'  -- Snippets
  -- use 'honza/vim-snippets'  -- Snippets
  -- use 'klen/nvim-test'  -- Run tests via nvim

end)