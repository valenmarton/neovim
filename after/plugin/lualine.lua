require("lualine").setup({
	-- options = { theme = 'solarized_dark' },
	options = {
		component_separators = "|",
		section_separators = { left = "", right = "" },
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return " " .. str
				end,
			},
		},
		lualine_b = {
			{
				"branch",
				icon = " ",
				-- color = { fg = "#a9a1e1", gui = "bold" },
			},
		},
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
		lualine_x = {
			{
				-- Lsp server name .
				function()
					local msg = "No Active Lsp"
					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
					local clients = vim.lsp.get_active_clients()
					if next(clients) == nil then
						return msg
					end
					for _, client in ipairs(clients) do
						local filetypes = client.config.filetypes
						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
							return client.name
						end
					end
					return msg
				end,
				icon = " LSP:",
				color = { fg = "#f6c177	", gui = "bold" },
			},
		},
	},
	inactive_sections = {
		lualine_c = {
			{
				"filename",
				path = 1,
			},
		},
	},
	tabline = {
		-- lualine_x = {
		--   'vim.fn.getcwd()'
		-- }
	},
})

vim.cmd("colorscheme rose-pine")
