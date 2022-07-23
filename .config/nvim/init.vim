syntax on


call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdtree'
Plug 'w0rp/ale'

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
Plug 'github/copilot.vim'

" Possible plugins to use
" Plug 'fannheyward/telescope-coc.nvim'  " Telescope & COC colab
" Plug 'rcarriga/nvim-notify'  " Notification system in neovim
" Plug 'mhinz/vim-startify'  " Customize the nvim start screen
" Plug 'rhysd/vim-grammarous'  " Grammer Help
" Plug 'sirver/ultisnips'  " Snippets
" Plug 'honza/vim-snippets'  " Snippets
" Plug 'L3MON4D3/LuaSnip'  " Snippets
" Plug 'klen/nvim-test'  " Run tests via nvim
" Plug 'neoclide/coc-git'  " git

call plug#end()

lua require('belax8')
