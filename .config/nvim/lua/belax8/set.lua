
-- UI
vim.opt.re = 0
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.ruler = true
vim.opt.errorbells = false
vim.opt.scrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.colorcolumn = '100'

-- Indenting
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smartindent = true

-- Search
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Coc Settings
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.shortmess:append('c')

-- Misc
vim.opt.expandtab = true
vim.opt.list = true
vim.opt.listchars = {
  tab = '»·',
  trail = '·',
  nbsp = '·'
}
vim.opt.linebreak = true
vim.opt.swapfile = false
vim.opt.mouse = 'a'
