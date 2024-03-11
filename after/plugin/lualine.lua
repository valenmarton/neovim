require("lualine").setup({
	options = {
		theme = "catppuccin",
		component_separators = "",
		icons_enabled = true,
	},
	sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{
				"filename",
				path = 1,
				file_status = true,
				shorting_target = 40, -- Shortens path to leave 40 spaces in the window
				-- for other components. (terrible name, any suggestions?)
				symbols = {
					modified = "[+]", -- Text to show when the file is modified.
					readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
					unnamed = "[No Name]", -- Text to show for unnamed buffers.
					newfile = "[New]", -- Text to show for newly created file before first write
				},
			},
		},
		lualine_x = { "location", "progress" },
		lualine_y = {},
		lualine_z = {},
	},
})

-- require("lualine").setup({
-- 	-- options = { theme = 'solarized_dark' },
-- 	options = {
-- 		-- component_separators = "",
-- 		-- component_separators = " ",
-- 		component_separators = "│",
-- 		-- section_separators = "",
-- 		-- section_separators = { left = "", right = "" },
-- 		icons_enabled = true,
-- 	},
-- 	sections = {
-- 		lualine_a = {
-- 			{
-- 				"mode",
-- 				fmt = function(str)
-- 					return " " .. str
-- 				end,
-- 				-- color = { gui = "" },
-- 			},
-- 		},
-- 		lualine_b = {
-- 			{
-- 				"branch",
-- 				icons_enabled = false,
-- 				fmt = function(str)
-- 					-- return "    " .. str
-- 					-- return str .. "   "
-- 					return " " .. str
-- 					-- return "  " .. str
-- 				end,
-- 			},
-- 			"diff",
-- 			-- "diagnostics",
-- 		},
-- 		lualine_c = {
-- 			{
-- 				"filename",
-- 				path = 1,
-- 				color = { gui = "bold" },
-- 				fmt = function(str)
-- 					-- print(vim.api.nvim_get_mode()["mode"])
-- 					-- return str .. "   "
-- 					-- return str .. "  "
-- 					return str
-- 				end,
-- 				-- symbols = {
-- 				-- 	modified = " ", -- Text to show when the file is modified.
-- 				-- 	readonly = "[-]", -- Text to show when the file is non-modifiable or readonly.
-- 				-- 	unnamed = "[No Name]", -- Text to show for unnamed buffers.
-- 				-- 	newfile = "[New]", -- Text to show for newly created file before first write
-- 				-- },
-- 			},
-- 			{
-- 				"diagnostics",
-- 				symbols = { error = "E:", warn = "W:", info = "I:", hint = "H:" },
-- 			},
-- 		},
-- 		lualine_x = {
-- 			{
-- 				-- Lsp server name .
-- 				function()
-- 					local msg = "No Active Lsp"
-- 					local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
-- 					local clients = vim.lsp.get_active_clients()
-- 					if next(clients) == nil then
-- 						return msg
-- 					end
-- 					for _, client in ipairs(clients) do
-- 						local filetypes = client.config.filetypes
-- 						if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
-- 							return client.name
-- 						end
-- 					end
-- 					return msg
-- 				end,
-- 				icon = " LSP:",
-- 				color = { fg = "#f6c177	", gui = "bold" },
-- 			},
-- 		},
-- 	},
-- 	inactive_sections = {
-- 		lualine_c = {
-- 			{
-- 				"filename",
-- 				path = 1,
-- 			},
-- 		},
-- 	},
-- 	tabline = {
-- 		-- lualine_x = {
-- 		--   'vim.fn.getcwd()'
-- 		-- }
-- 	},
-- })
--
