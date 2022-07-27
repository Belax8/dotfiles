syntax on


call plug#begin('~/.vim/plugged')

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

" Completion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
" Plug 'hrsh7th/cmp-cmdline'

Plug 'preservim/nerdtree'

" One Theme
Plug 'rakr/vim-one'

" Prettier
Plug 'sbdchd/neoformat'

" Harpoon
Plug 'nvim-lua/plenary.nvim' " Needed for Harpoon & Telescope
Plug 'ThePrimeagen/harpoon'

" Telescope
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }

" Git Diff in gutter
Plug 'airblade/vim-gitgutter'

" Notifications
Plug 'rcarriga/nvim-notify'

" Check Git blame on a line
Plug 'rhysd/git-messenger.vim'

" Github Copilot
" Plug 'github/copilot.vim'

" Possible plugins to use
" Plug 'rcarriga/nvim-notify'  " Notification system in neovim
" Plug 'mhinz/vim-startify'  " Customize the nvim start screen
" Plug 'rhysd/vim-grammarous'  " Grammer Help
" Plug 'sirver/ultisnips'  " Snippets
" Plug 'honza/vim-snippets'  " Snippets
" Plug 'klen/nvim-test'  " Run tests via nvim

call plug#end()

lua require('belax8')
