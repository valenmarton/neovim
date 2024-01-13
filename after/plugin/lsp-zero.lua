local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  -- to learn the available actions

  lsp.default_keymaps({ buffer = bufnr })
  lsp.buffer_autoformat()

  local opts = { buffer = bufnr }

  vim.keymap.set({ 'n', 'x' }, '<leader>cf', function() --maybe gf is better
    vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
  end, opts)
  vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)
  vim.keymap.set('n', 'gi', '<cmd>Telescope lsp_definitions<cr>', opts)
  vim.keymap.set('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', {})
  vim.keymap.set("n", "<leader>ws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set('n', '<leader>rn', function() --rename symbol
    vim.lsp.buf.rename()
  end)
  vim.keymap.set('n', '<leader>ca', function()
    vim.lsp.buf.code_action({ async = false, timeout_ms = 10000 })
  end, opts)
  vim.keymap.set({ 'n', 'i' }, '<C-h>', function()
    vim.lsp.buf.signature_help()
  end)

  --TODO: maybe more telescope
  -- lsp.set_sign_icons({
  --   error = ' ',
  --   -- error = '',
  --   warn = ' ',
  --   -- warn = '',
  --   hint = ' ',
  --   -- hint = ' ',
  --   info = ' '
  -- })
end)
-- (Optional) Configure lua language server for neovim
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
-- WARN: TO VALIDATE: :lua require('lsp-zero.check').inspect_server_config('tsserver')
-- :lua require('lsp-zero.check').inspect_settings('tsserver')
-- TODO: quotePreference is not working
require('lspconfig').tsserver.setup({
  filetypes = { "typescript", "typescriptreact", "typescript.tsx", "javascript" },
  init_options = {
    preferences = {
      -- other preferences...
      importModuleSpecifierPreference = 'relative',
      importModuleSpecifierEnding = 'minimal',
      quotePreference = "single",
    },
    format = {
      semicolons = 'insert',
      insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
      trimTrailingWhitespace = true,
    },
  },
  -- FIX: how does this work
  settings = {
    completions = {
      completeFunctionCalls = true
    },
    preferences = {
      quotePreference = "single",
      importModuleSpecifier = "relative"
    },
    typescript = {
      format = {
        semicolons = 'insert',
        insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = false,
        trimTrailingWhitespace = true,
      },
      preferences = {
        quoteStyle = "single",
        importModuleSpecifier = "relative",
        importModuleSpecifierPreference = "relative"
      },
    },
    javascript = {
      preferences = {
        quoteStyle = "single"
      }
    }
  }
})
-- require('lspconfig').tsserver.setup({
--   on_attach = function(client, bufnr)
--     print("hello tserver")
--   end
-- })
--
require('lspconfig').html.setup({
  on_attach = function(client, bufnr)
    print(client)
  end,
  settings = {
    html = {
      format = {
        templating = false,
        preserveNewLines = true,
        extraLiners = '',
        indentInnerHtml = true,
        wrapLineLength = 120,
      },
    },
  }
})

lsp.setup()

-- You need to setup `cmp` after lsp-zero
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local lspkind = require('lspkind') --only for fancy cmp icons
-- local luasnip = require('luasnip')
-- require('luasnip.loaders.from_vscode').lazy_load()

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
    ['<C-j>'] = cmp_action.luasnip_supertab(),
    ['<C-k>'] = cmp_action.luasnip_shift_supertab(),
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text',
      preset = 'codicons'
    })
  },
  snippet = {
    expand = function(args)
      require 'luasnip'.lsp_expand(args.body)
    end
  },
  sources = {
    { name = 'nvim_lsp_signature_help' }, { name = 'nvim_lsp' }, { name = 'buffer' }, { name = 'path' }, { name = 'cmdline' }, { name = 'luasnip' }
  }
})

--TODO: cmdline with ctrl j-k, nvim-autotag?, angular snippets

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
