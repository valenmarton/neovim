vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.softtabstop = 0
vim.opt.autoindent = true
vim.smarttab = true
vim.opt.shell = "/bin/zsh"

--vim.opt.scrolloff = 8 --10 my previous preset (is 999 - cursor in the middle every time - useful?)
-- vim.opt.signcolumn = "yes"
vim.opt.incsearch = true
vim.opt.wrap = false

-- turning off swapfile, using undotree plugin instead
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.hlsearch = false
vim.opt.cursorline = true

vim.opt.title = true

-- USE tabs instead of spaces in vim
-- vim.cmd('set autoindent')
-- vim.cmd('set noexpandtab')
-- vim.cmd('set tabstop=2')
-- vim.cmd('set shiftwidth=2')

-- no cursor in insert mode
-- vim.opt.guicursor = ""

-- column width indicator
-- vim.opt.colorcolumn = "120"

vim.opt.cmdheight = 2
