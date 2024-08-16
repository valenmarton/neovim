-- vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
require("trouble").setup({})
vim.keymap.set("n", "<C-t>", "<cmd>Trouble diagnostics toggle focus=true<cr>")

-- using these for jumping pages
-- vim.keymap.set("n", "<C-j>", function()
-- 	require("trouble").next({ skip_groups = true, jump = true })
-- end)
-- vim.keymap.set("n", "<C-k>", function()
-- 	require("trouble").prev({ skip_groups = true, jump = true })
-- end)
