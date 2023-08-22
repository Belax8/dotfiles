-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = function()
          pcall(vim.cmd, 'MasonUpdate')
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional

      {'hrsh7th/nvim-cmp'},     -- Required
      {'hrsh7th/cmp-nvim-lsp'}, -- Required
      {'L3MON4D3/LuaSnip'},     -- Required
      -- others
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-buffer'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lua'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
  }
  use {
    'https://codeberg.org/esensar/nvim-dev-container',
    requires = { 'nvim-treesitter/nvim-treesitter' }
  }
  use 'miversen33/netman.nvim'

  use 'rakr/vim-one'

  use 'sbdchd/neoformat'

  use {
    'ThePrimeagen/harpoon',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  -- use { 'nvim-treesitter/playground' }
  use { 'nvim-treesitter/nvim-treesitter-context' }
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }

  use { 'mbbill/undotree' }
  use { 'tpope/vim-fugitive' }

  use {'airblade/vim-gitgutter', branch = 'main'}

  use 'rcarriga/nvim-notify'

  use 'rhysd/git-messenger.vim'

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
