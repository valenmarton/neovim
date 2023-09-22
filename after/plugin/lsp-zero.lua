local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions
  lsp.default_keymaps({ buffer = bufnr })
  lsp.buffer_autoformat()

  local opts = { buffer = bufnr }

  vim.keymap.set({ 'n', 'x' }, '<leader>f', function() --maybe gf is better
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end, opts)
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_definitions<cr>', opts)
  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '<leader>rn', function() --rename symbol
  end)
  vim.keymap.set('n', '<leader>ca', function()
    vim.lsp.buf.code_action({ async = false, timeout_ms = 10000 })
  end, opts)

  --TODO: maybe more telescope

  lsp.set_sign_icons({
    error = '✘',
    warn = '▲',
    hint = '⚑',
    info = '»'
  })
end)
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
-- require('lspconfig').tsserver.setup({
--   on_attach = function(client, bufnr)
--     print("hello tserver")
--   end
-- })

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local lspkind = require('lspkind') --only for fancy cmp icons

cmp.setup({
  mapping = {
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({ select = false }),

    -- Ctrl+Space to trigger completion menu
    ['<C-Space>'] = cmp.mapping.complete(),
    -- Navigate between snippet placeholder
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      preset = 'codicons'
    })
  },
  sources = {
    { name = 'nvim_lsp_signature_help' }, { name = 'nvim_lsp' }, { name = 'buffer' }, { name = 'path' }
  }
}
)
