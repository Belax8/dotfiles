-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

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
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x' }

  -- Git Diff in gutter
  use 'airblade/vim-gitgutter'

  -- Notifications
  use 'rcarriga/nvim-notify'

  -- Check Git blame on a line
  use 'rhysd/git-messenger.vim'

  -- Easy Comments
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }

  use {
    'klen/nvim-test',
    after = { 'nvim-treesitter' },
    config = function()
      require('nvim-test').setup({
        termOpts = {
          direction = 'horizontal'
        }
      })
    end
  }

  -- Possible plugins to use
  -- use 'mhinz/vim-startify'  -- Customize the nvim start screen
  -- use 'rhysd/vim-grammarous'  -- Grammer Help
  -- use 'lspcontainers/lspcontainers.nvim'  -- attach lsp to docker container

end)
