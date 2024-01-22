require('lspsaga').setup({
  symbol_in_winbar = {
    enable = false
  },
  lightbulb = {
    virtual_text = false
  },
  ui = {
    code_action = '',
    enable = false,
  }
})

-- vim.keymap.set('n', 'K', '<cmd>Lspsaga hover_doc<CR>')
vim.keymap.set('n', 'gf', '<cmd>Lspsaga finder<CR>')
vim.keymap.set('n', 'gp', '<cmd>Lspsaga peek_definition<CR>')
vim.keymap.set('n', '<leader>ic', '<cmd>Lspsaga incoming_calls<CR>')
vim.keymap.set('n', '<leader>oc', '<cmd>Lspsaga outgoing_calls<CR>')

function _G.show_line_diagnostics()
  vim.lsp.diagnostic.show_line_diagnostics({ border = 'single' })
end
