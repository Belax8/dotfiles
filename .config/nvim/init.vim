syntax on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""SETS""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UI
set re=0
set number
set relativenumber
set ruler
set noerrorbells
set scrolloff=8
set signcolumn=yes
set splitright
set splitbelow
set colorcolumn=100
" Indenting
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smartindent
" Search
set nohlsearch
set incsearch
" Coc Settings
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
" Misc
set expandtab
set list listchars=tab:»·,trail:·,nbsp:·
set linebreak
set noswapfile


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""PLUGINS""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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
" Plug 'neoclide/coc-git'  " git

call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""CONFIG""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" misc
imap jj <Esc>


" Coc
let g:coc_global_extensions = [
\  'coc-json',
\  'coc-tsserver',
\  'coc-pyright',
\  'coc-yaml',
\  'coc-eslint',
\  'coc-css',
\  'coc-html',
\  'coc-jest'
\ ]
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> rn <Plug>(coc-rename)
nmap <leader>cl  <Plug>(coc-codelens-action)


" harpoon
lua require("harpoon").setup({ nav_first_in_list = true })
nnoremap <leader>a <cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>h <cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>

nnoremap <leader>1 <cmd>lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 <cmd>lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>3 <cmd>lua require("harpoon.ui").nav_file(3)<CR>
nnoremap <leader>4 <cmd>lua require("harpoon.ui").nav_file(4)<CR>


" Nerd Tree
let NERDTreeShowHidden=1
nnoremap <C-o> :NERDTreeToggle %<CR>


" Telescope
nnoremap <leader>ff <cmd>Telescope find_files hidden=true<cr>
nnoremap <leader>fg <cmd>Telescope live_grep hidden=true<cr>
nnoremap <leader>fb <cmd>Telescope buffers hidden=true<cr>
nnoremap <leader>fh <cmd>Telescope help_tags hidden=true<cr>


" One theme
let g:airline_theme='one'
colorscheme one
set background=dark
let g:one_allow_italics = 1
" for themes inside of tmux
set t_8b=^[[48;2;%lu;%lu;%lum
set t_8f=^[[38;2;%lu;%lu;%lum
augroup ONETHEME
  " call one#highlight('group', 'foreground', 'background', 'attribute')
  autocmd BufReadPost * call one#highlight('PMenu', 'ffffff', '005174', 'none')
  autocmd BufReadPost * call one#highlight('PMenuSel', 'ffffff', '005174', 'none')
  autocmd BufReadPost * call one#highlight('PMenuSbar', 'ffffff', '005174', 'none')
  autocmd BufReadPost * call one#highlight('PMenuThumb', 'ffffff', '005174', 'none')
  autocmd BufReadPost * call one#highlight('ColorColumn', 'ffffff', '262626', 'none')
augroup END


" Git Messenger
nnoremap <leader>gm <cmd>GitMessenger<cr>


" Prettier
let g:neoformat_try_node_exe = 1  " use Prettier in node_modules/.bin/prettier
augroup PRETTIER
  autocmd BufWritePre * Neoformat  " Run Prettier on file save
augroup END


" Belax
" augroup BELAX
" augroup END

