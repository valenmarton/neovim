-- vim.keymap.set("n", "<leader>xx", function() require("trouble").toggle() end)
vim.keymap.set("n", "<C-t>", function() require("trouble").toggle() end)
vim.keymap.set("n", "<C-j>", function() require("trouble").next({ skip_groups = true, jump = true }) end)
vim.keymap.set("n", "<C-k>", function() require("trouble").previous({ skip_groups = true, jump = true }) end)
