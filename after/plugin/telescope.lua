local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader><space>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})

vim.keymap.set('n', '<leadear>sr', builtin.oldfiles, {}) --search recent

-- <leader>sr could be search references, currently in lsp config (gr)

vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, {}) --search symbols

vim.keymap.set('n', '<leader>,', builtin.buffers, {})

vim.keymap.set('n', '<leader>.', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>/', builtin.live_grep, {})
