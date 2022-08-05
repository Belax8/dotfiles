local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  vim.notify('Unable to load lspconfig', vim.log.level.ERROR)
  return
end

local nnoremap = require('belax8.remap').nnoremap

require('nvim-lsp-installer').setup({
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        icons = {
            server_installed = '✓',
            server_pending = '➜',
            server_uninstalled = '✗'
        }
    }
})

local lsp_on_attach = function()
    nnoremap('K', vim.lsp.buf.hover, { buffer = 0 })
    nnoremap('gd', vim.lsp.buf.definition, { buffer = 0 })
    nnoremap('gt', vim.lsp.buf.type_definition, { buffer = 0 })
    nnoremap('gi', vim.lsp.buf.implementation, { buffer = 0 })
    nnoremap('<leader>dj', vim.diagnostic.goto_next, { buffer = 0 })
    nnoremap('<leader>dk', vim.diagnostic.goto_prev, { buffer = 0 })
    nnoremap('<leader>dl', '<cmd>Telescope diagnostics<cr>', { buffer = 0 })
    nnoremap('<leader>rn', vim.lsp.buf.rename, { buffer = 0 })
    nnoremap('<leader>ca', vim.lsp.buf.code_action, { buffer = 0 })
end


vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Setup nvim-cmp.
local cmp = require('cmp')

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    -- ['<C-k>'] = cmp.mapping.select_prev_item(),
    -- ['<C-j>'] = cmp.mapping.select_next_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})


-- Setup lspconfig.
local servers = {
  'angularls',
  'bashls',
  -- 'csharp_ls',
  'cssls',
  'dockerls',
  'eslint',
  'grammarly',
  'graphql',
  'html',
  'jsonls',
  'omnisharp',
  'prismals',
  'pyright',
  -- 'sumneko_lua',
  'tailwindcss',
  'tsserver',
}


for _, value in ipairs(servers) do
  lspconfig[value].setup({
    on_attach = lsp_on_attach,
    capabilities = capabilities,
    root_dir = lspconfig.util.root_pattern('.git', vim.fn.getcwd()),
  })
end

lspconfig.sumneko_lua.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  root_dir = lspconfig.util.root_pattern('.git', vim.fn.getcwd()),
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'}
      }
    }
  }
})
