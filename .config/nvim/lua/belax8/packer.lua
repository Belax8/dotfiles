
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

  use 'preservim/nerdtree'

  use 'rakr/vim-one'

  use 'sbdchd/neoformat'

  use {
    'ThePrimeagen/harpoon',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- use { 'nvim-treesitter/playground' }

  use { 'mbbill/undotree' }

  use { 'tpope/vim-fugitive' }

  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = {
      {'nvim-lua/plenary.nvim'}
    }
  }

  use 'airblade/vim-gitgutter'

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
