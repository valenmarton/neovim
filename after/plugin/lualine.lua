require("lualine").setup({
	-- options = { theme = 'solarized_dark' },
	options = {
		component_separators = "|",
		section_separators = { left = "", right = "" },
		icons_enabled = true,
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return " " .. str
				end,
				-- color = { gui = "" },
			},
		},
		lualine_b = {
			{
				"branch",
				"diff",
				"diagnostics",
				icon = " ",
				-- color = { gui = "bold" },
				-- color = { fg = "#a9a1e1", gui = "bold" },
			},
		},
		lualine_c = {
			{
				"filename",
				path = 1,
				color = { gui = "bold" },
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
