vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set("n", "<BS><BS>", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- using trouble instead
-- vim.keymap.set("n", "<C-j>", "<cmd>lua vim.diagnostic.goto_next()<CR>")
-- vim.keymap.set("n", "<C-k>", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

-- do not yank with x
vim.keymap.set("n", "x", '"_x')

vim.keymap.set("n", "<leader>bd", "<cmd>%bd|e#<cr>", { desc = "Close all buffers but the current one" }) -- https://stackoverflow.com/a/42071865/516188

-- Save on ctrl+s
vim.keymap.set({ "n", "i" }, "<C-s>", "<Esc><CMD>w<CR>")
-- vim.keymap.set({ "n", "i" }, "<C-a>", "<Esc>ggVG")

vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set({ "n", "i" }, "<S-Up>", "")
vim.keymap.set({ "n", "i" }, "<S-Down>", "")

vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- disable arrow keys
vim.keymap.set("i", "<Up>", "")
vim.keymap.set("i", "<Down>", "")
-- jump to paragraph
vim.keymap.set("n", "<Down>", "}")
vim.keymap.set("n", "<Up>", "{")
-- vim.keymap.set("n", "<S-Down>", "}")
-- vim.keymap.set("n", "<S-Up>", "{")

-- vim.keymap.set({ "n", "i" }, "<S-Down>", ")")
-- vim.keymap.set({ "n", "i" }, "<S-Up>", "(")

vim.keymap.set("n", "<leader><Tab>", ":b#<CR>")
-- vim.keymap.set("n", "<C-e>", "<cmd>bp<CR>")
-- vim.keymap.set("n", "<C-y>", "<cmd>bn<CR>")
