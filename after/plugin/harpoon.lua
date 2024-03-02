require("harpoon").setup({
	tabline = false,
})

local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>e", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function()
	ui.nav_file(1)
end)
vim.keymap.set("n", "<leader>2", function()
	ui.nav_file(2)
end)
vim.keymap.set("n", "<leader>3", function()
	ui.nav_file(3)
end)
vim.keymap.set("n", "<leader>4", function()
	ui.nav_file(4)
end)
vim.keymap.set("n", "<leader>5", function()
	ui.nav_file(5)
end)
vim.keymap.set("n", "<leader>6", function()
	ui.nav_file(6)
end)
--
-- vim.keymap.set("n", "<C-e>", function()
-- 	ui.nav_prev()
-- end)
--
-- vim.keymap.set("n", "<C-y>", function()
-- 	ui.nav_next()
-- end)
--
-- -- load colorscheme here to use the same harpoon theme
-- vim.cmd("colorscheme rose-pine")
