function set_cwd_to_current_file()
	local current_file = vim.fn.expand("%:p")
	local current_directory = vim.fn.fnamemodify(current_file, ":h")
	-- print(current_file)
	-- print("Browsing with oil.nvim")
	if string.find(current_directory, "oil") then
		current_directory = string.sub(current_directory, 7)
	end
	-- local opened_dir_without_oil_prefix = string.sub(current_directory, 7) -- Removes the first 6 characters
	-- print("Set cwd => " .. current_directory)
	vim.cmd("cd " .. current_directory)
end

vim.cmd([[
 augroup cdpwd
     autocmd!
     autocmd VimEnter * lua set_cwd_to_current_file()
 augroup END
 ]])

require("valentin.set")
require("valentin.remap")
require("valentin.lazy")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- :help highlight
-- disabling background on gitsings
vim.cmd("highlight GitSignsAdd guibg=NONE")
vim.cmd("highlight GitSignsChange guibg=NONE")
vim.cmd("highlight GitSignsDelete guibg=NONE")

-- vim.cmd("set stl+=%{expand('%:~:.')}") -- show the current file relative path to the :pwd
-- vim.cmd("set ruler") -- show the current file relative path to the :pwd
-- vim.cmd("set rulerformat=%l,%v")
-- vim.cmd("set statusline+=%{&modified?'[+]':''}") -- show the current file relative path to the :pwd
-- vim.cmd("set statusline=%{expand('%:p:h:t')}/%t")
-- vim.o.statusline = [[%{fnamemodify(expand("%"), ":~:.")}\ %l:%c]]
-- vim.o.statusline = [[%{fnamemodify(expand("%"), ":~:.")}%=%l:%c]]
--
-- statusline without lualine
-- vim.cmd("highlight statusline gui=bold")
-- vim.cmd("highlight statusline guifg=#908caa")
-- vim.cmd("highlight statusline guibg=#191724")
