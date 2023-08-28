
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local remap = require('belax8.remap')
local nnoremap = remap.nnoremap
local inoremap = remap.inoremap
local vnoremap = remap.vnoremap

local silent = { silent = true }

-- Notify
-- vim.notify = require('belax8.notify').notify
nnoremap('<leader>nh', function() require('telescope').extensions.notify.notify() end, silent)


-- Treesitter
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'bash', 'c_sharp', 'css', 'dockerfile', 'go', 'graphql', 'hjson', 'html',
  'javascript', 'jsonc', 'lua', 'prisma', 'python', 'rust', 'scss', 'typescript' },

  sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
  auto_install = true,  -- Automatically install missing parsers when entering buffer

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})
require('treesitter-context').setup({enable = false})
nnoremap('<leader>ct', '<cmd>TSContextToggle<cr>')


-- Misc
inoremap('jj', '<esc>') -- exit insert mode with jj
vnoremap('J', ":m '>+1<CR>gv=gv") -- move the selected block up
vnoremap('K', ":m '>-2<CR>gv=gv") -- move the selected block down

nnoremap('<C-j>', '<cmd>cnext<CR>zz') -- jump to next in quickfix
nnoremap('<C-k>', '<cmd>cprev<CR>zz') -- jump to prev in quickfix

nnoremap('<C-u>', '<C-u>zz') -- scroll up and then center the screen
nnoremap('<C-d>', '<C-d>zz') -- scroll down and then center the screen


-- Harpoon
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
nnoremap('<leader>0', function() require('harpoon.ui').nav_file(10) end, silent)


-- NeoTree
vim.g.netman_log_level = 1
require("neo-tree").setup({
  sources = {
      "buffers",
      "filesystem",
  },
  source_selector = {
    sources = {
      winbar = true,
      statusline = true,
      { source = "remote" }
    },
  },
  filesystem = {
    filtered_items = {
      hide_dotfiles = false,
      hide_gitignored = false,
      never_show = {
        ".DS_Store",
      },
    },
  }
})
nnoremap('<C-o>', '<cmd>Neotree toggle reveal<cr>')
nnoremap('<C-nr>', '<cmd>Neotree remote<cr>')


-- Telescope
nnoremap('<leader>ff', '<cmd>Telescope find_files hidden=true<cr>')
nnoremap('<leader>fg', '<cmd>Telescope live_grep hidden=true<cr>')
nnoremap('<leader>fw', '<cmd>Telescope grep_string hidden=true<cr>')
nnoremap('<leader>fb', '<cmd>Telescope buffers hidden=true<cr>')
nnoremap('<leader>fh', '<cmd>Telescope help_tags hidden=true<cr>')


-- nvim-test
nnoremap('<leader>tf', '<cmd>TestFile<cr>')
nnoremap('<leader>ts', '<cmd>TestSuite<cr>')
nnoremap('<leader>tn', '<cmd>TestNearest<cr>')
nnoremap('<leader>tl', '<cmd>TestLast<cr>')


-- Git Messenger
nnoremap('<leader>gm', '<cmd>GitMessenger<cr>')


-- One theme
local vim_theme = os.getenv("VIM_THEME")
local dark_theme = (vim_theme == 'dark' or vim_theme == '') and true or false
vim.g.airline_theme='one'
vim.cmd('colorscheme one')
vim.opt.background = dark_theme and 'dark' or 'light'
vim.g.one_allow_italics = 1
-- for themes inside of tmux
vim.cmd('set t_8b=^[[48;2;%lu;%lu;%lum')
vim.cmd('set t_8f=^[[38;2;%lu;%lu;%lum')

OneThemeGroup = augroup('OneTheme', {})
local themeOverrides = {
  'PMenu',
  'PMenuSel',
  'PMenuSbar',
  'PMenuThumb',
  'ColorColumn'
}
for _, value in ipairs(themeOverrides) do
  local fg = dark_theme and 'ffffff' or '262626'
  local bg = dark_theme and '262626' or 'ffffff'
  autocmd('BufReadPost', {
    pattern = '*',
    command = "call one#highlight('" .. value .. "', '" .. fg .. "', '" .. bg .. "', 'none')",
    group = OneThemeGroup
  })
end


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
