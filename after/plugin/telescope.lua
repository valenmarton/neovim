-- DEFAULTS
require('telescope').setup {
  -- FIX: use -u only in certain cases, now live_grep does not respect gitignore and hidden files
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
      '-u' -- thats the new thing
    },
  }
}
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

-- :Telescope find_files find_command=rg,--ignore,--hidden,--files prompt_prefix=🔍,-u  SEARCH ALL FILES


-- ADDING project_files: search in git_files, if no .git fallback to find_files
-- TODO: not working
--
-- local M = {}
--
-- -- We cache the results of "git rev-parse"
-- -- Process creation is expensive in Windows, so this reduces latency
-- local is_inside_work_tree = {}
--
-- M.project_files = function()
--   local opts = {} -- define here if you want to define something
--
--   local cwd = vim.fn.getcwd()
--   if is_inside_work_tree[cwd] == nil then
--     vim.fn.system("git rev-parse --is-inside-work-tree")
--     is_inside_work_tree[cwd] = vim.v.shell_error == 0
--   end
--
--   if is_inside_work_tree[cwd] then
--     builtin.git_files(opts)
--   else
--     builtin.find_files(opts)
--   end
-- end
--
--
-- vim.api.nvim_set_keymap("n", "<Leader><Space>", "<CMD>lua project_files()<CR>",
--   { noremap = true, silent = true })
--
-- return M
