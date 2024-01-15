--TODO: use vim.opt for vim.cmd
--
-- no cursor in insert mode
vim.opt.guicursor = ""
vim.cmd('set relativenumber')
vim.cmd('set number')

vim.cmd('set tabstop=2')
vim.cmd('set shiftwidth=2')
vim.cmd('set expandtab')
vim.cmd('set softtabstop=0')
vim.cmd('set autoindent')
vim.cmd('set smarttab')
vim.cmd('set shell=/bin/zsh')

-- USE tabs instead of spaces in vim
-- vim.cmd('set autoindent')
-- vim.cmd('set noexpandtab')
-- vim.cmd('set tabstop=2')
-- vim.cmd('set shiftwidth=2')

vim.opt.scrolloff = 8 --10 my previous preset (is 999 - cursor in the middle every time - useful?)
vim.opt.signcolumn = "yes"
vim.opt.incsearch = true

-- turning off swapfile, using undotree plugin instead
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.termguicolors = true

vim.opt.hlsearch = false
vim.opt.cursorline = true

vim.opt.title = true
-- vim.opt.cmdheight = 0vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
