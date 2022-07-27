
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local remap = require('belax8.remap')
local nnoremap = remap.nnoremap
local vnoremap = remap.vnoremap
local inoremap = remap.inoremap
local xnoremap = remap.xnoremap
local nmap = remap.nmap


-- Notify
vim.notify = require('belax8.notify').notify
nnoremap('<leader>nh', function() require('telescope').extensions.notify.notify() end, silent)


-- Misc
inoremap('jj', '<esc>')


-- Harpoon
local silent = { silent = true }
require('harpoon').setup({ nav_first_in_list = true })
require('telescope').load_extension('harpoon')
nnoremap('<leader>a', function() require('harpoon.mark').add_file() end, silent)
nnoremap('<leader>h', function() require('harpoon.ui').toggle_quick_menu() end, silent)
nnoremap('<leader>hm', '<cmd>Telescope harpoon marks<cr>', silent)

nnoremap('<leader>1', function() require('harpoon.ui').nav_file(1) end, silent)
nnoremap('<leader>2', function() require('harpoon.ui').nav_file(2) end, silent)
nnoremap('<leader>3', function() require('harpoon.ui').nav_file(3) end, silent)
nnoremap('<leader>4', function() require('harpoon.ui').nav_file(4) end, silent)
nnoremap('<leader>5', function() require('harpoon.ui').nav_file(5) end, silent)
nnoremap('<leader>6', function() require('harpoon.ui').nav_file(6) end, silent)
nnoremap('<leader>7', function() require('harpoon.ui').nav_file(7) end, silent)
nnoremap('<leader>8', function() require('harpoon.ui').nav_file(8) end, silent)
nnoremap('<leader>9', function() require('harpoon.ui').nav_file(9) end, silent)


-- Nerd Tree
vim.cmd('let NERDTreeShowHidden=1')
nnoremap('<C-o>', '<cmd>NERDTreeToggle %<cr>')


-- Telescope
nnoremap('<leader>ff', '<cmd>Telescope find_files hidden=true<cr>')
nnoremap('<leader>df', '<cmd>Telescope find_files hidden=true cwd=~/.dotfiles<cr>')
nnoremap('<leader>fg', '<cmd>Telescope live_grep hidden=true<cr>')
nnoremap('<leader>fb', '<cmd>Telescope buffers hidden=true<cr>')
nnoremap('<leader>fh', '<cmd>Telescope help_tags hidden=true<cr>')


-- One theme
vim.g.airline_theme='one'
vim.cmd('colorscheme one')
vim.opt.background = 'dark'
vim.g.one_allow_italics = 1
-- for themes inside of tmux
vim.cmd('set t_8b=^[[48;2;%lu;%lu;%lum')
vim.cmd('set t_8f=^[[38;2;%lu;%lu;%lum')

OneThemeGroup = augroup('OneTheme', {})
autocmd('BufReadPost', {
  pattern = '*',
  command = "call one#highlight('PMenu', 'ffffff', '005174', 'none')",
  group = OneThemeGroup
})
autocmd('BufReadPost', {
  pattern = '*',
  command = "call one#highlight('PMenuSel', 'ffffff', '005174', 'none')",
  group = OneThemeGroup
})
autocmd('BufReadPost', {
  pattern = '*',
  command = "call one#highlight('PMenuSbar', 'ffffff', '005174', 'none')",
  group = OneThemeGroup
})
autocmd('BufReadPost', {
  pattern = '*',
  command = "call one#highlight('PMenuThumb', 'ffffff', '005174', 'none')",
  group = OneThemeGroup
})
autocmd('BufReadPost', {
  pattern = '*',
  command = "call one#highlight('ColorColumn', 'ffffff', '262626', 'none')",
  group = OneThemeGroup
})


-- Git Messenger
nnoremap('<leader>gm', '<cmd>GitMessenger<cr>')


-- Prettier
vim.g.neoformat_try_node_exe = 1  -- use Prettier in node_modules/.bin/prettier
PrettierGroup = augroup('Prettier', {})
--[[
autocmd('BufWritePre', {
  pattern = '*',
  callback = function()
    vim.cmd('Neoformat')
    vim.schedule(function()
      vim.notify('Formatted', 'prettier', { timeout = 500 })
    end)
  end,
  group = PrettierGroup
})
--]]