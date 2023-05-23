local lsp = require('lsp-zero')
local nnoremap = require('belax8.remap').nnoremap
local inoremap = require('belax8.remap').inoremap

lsp.preset('recommended')

lsp.ensure_installed({
  'angularls',
  'bashls',
  'cssls',
  'dockerls',
  'eslint',
  'grammarly',
  'graphql',
  'html',
  'jsonls',
  'lua_ls',
  'prismals',
  'pyright',
  'tailwindcss',
  'tsserver'
})

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp = require('cmp')
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
})

lsp.setup_nvim_cmp({
  mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr }
  nnoremap('K', vim.lsp.buf.hover, opts)
  nnoremap('gd', vim.lsp.buf.definition, opts)
  nnoremap('gt', vim.lsp.buf.type_definition, opts)
  nnoremap('gi', vim.lsp.buf.implementation, opts)
  nnoremap('<leader>dj', vim.diagnostic.goto_next, opts)
  nnoremap('<leader>dk', vim.diagnostic.goto_prev, opts)
  nnoremap('<leader>dl', '<cmd>Telescope diagnostics<cr>', opts)
  nnoremap('<leader>rn', vim.lsp.buf.rename, opts)
  nnoremap('<leader>ca', vim.lsp.buf.code_action, opts)
  inoremap('<C-h>', vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

