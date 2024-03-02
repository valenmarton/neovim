local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Colorscheme
	{ "VonHeikemen/little-wonder" },
	{ "NLKNguyen/papercolor-theme" },
	"rebelot/kanagawa.nvim",
	"kaiuri/nvim-juliana",
	"doums/darcula",
	{ "briones-gabriel/darcula-solid.nvim", dependencies = {
		"rktjmp/lush.nvim",
	} },
	{
		"rose-pine/neovim",
		lazy = false,
		priority = 1000,
		name = "rose-pine",
		opts = {
			styles = {
				italic = false,
				transparency = true,
			},
		},
		-- this runs before opts :(
		-- config = function()
		-- 	vim.cmd([[colorscheme rose-pine]])
		-- end,
	},
	{ "ellisonleao/gruvbox.nvim" },
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		-- config = function()
		--   vim.cmd([[colorscheme catppuccin]])
		-- end
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"folke/tokyonight.nvim",
		opts = {
			styles = {
				keywords = {
					italic = false,
				},
			},
		},
	},
	{
		"bluz71/vim-nightfly-colors",
		opts = {
			-- nightflyCursorColor = 1,
		},
		config = function()
			vim.g.nightflyCursorColor = true
			-- vim.g.nightflyTransparent = true
			vim.g.nightflyWinSeparator = 2
			vim.g.nightflyVirtualTextColor = true
			-- vim.g.nightflyUnderlineMatchParen = true
			vim.g.nightflyTerminalColors = true
			vim.g.nightflyNormalFloat = true
			-- Lua initialization file
			vim.opt.fillchars = {
				horiz = "━",
				horizup = "┻",
				horizdown = "┳",
				vert = "┃",
				vertleft = "┫",
				vertright = "┣",
				verthoriz = "╋",
			}
			local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
			vim.api.nvim_create_autocmd("ColorScheme", {
				pattern = "nightfly",
				callback = function()
					vim.api.nvim_set_hl(0, "Function", { fg = "#82aaff", bold = true })
				end,
				group = custom_highlight,
			})
		end,
	},

	-- Search
	{ "nvim-telescope/telescope.nvim" },
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
		},
	},
	-- WARN: using forked branch for topview cmp suggestions
	--
	-- https://github.com/hrsh7th/nvim-cmp/pull/1701
	-- { 'llllvvuu/nvim-cmp',                  branch = 'feat/above' },
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
		-- enabled = false,
		dependencies = {
			"rafamadriz/friendly-snippets",
			-- config = function()
			--   require("luasnip.loaders.from_vscode").lazy_load()
			-- end,
		},
	},
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },
	{ "hrsh7th/cmp-path" },
	{ "hrsh7th/cmp-buffer" },
	-- { "hrsh7th/cmp-cmdline" },
	{ "saadparwaiz1/cmp_luasnip" },
	-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
	{
		"numToStr/Comment.nvim",
		dependencies = {
			"JoosepAlviste/nvim-ts-context-commentstring",
			opts = {
				enable_autocmd = false,
			},
		},
		config = function()
			require("Comment").setup({
				pre_hook = function()
					return vim.bo.commentstring
				end,
			})
		end,
	},
	{
		"kdheepak/lazygit.nvim",
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},
	{
		"windwp/nvim-autopairs",
		enabled = true,
		event = "InsertEnter",
		opts = {},
	},
	-- { 'machakann/vim-sandwich' },
	"tpope/vim-surround",
	{
		"stevearc/dressing.nvim",
		enabled = true,
		event = "VeryLazy",
		opts = {},
	},
	{ "ThePrimeagen/harpoon", enabled = true, opts = {} },
	{ "mbbill/undotree", enabled = false },
	{
		"onsails/lspkind.nvim",
		enabled = true, -- cmp icons
	},
	{ "nvim-lualine/lualine.nvim", enabled = false }, -- statusbar under
	{ "nvim-tree/nvim-web-devicons", lazy = true },
	{ "lewis6991/gitsigns.nvim" },
	-- TODO:
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			signs = false,
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			mode = "document_diagnostics",
			action_keys = {
				open_tab = { "<c-&>" },
			},
			fold_open = "󰁃", -- icon used for open folds
			fold_closed = "",
			icons = true,
			signs = {
				-- icons / text used for a diagnostic
				error = "E:",
				warning = "W:",
				hint = "H:",
				information = "I:",
				other = "O:",
			},
		},
	},
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons", enabled = false },
	{ "tjdevries/colorbuddy.nvim", enabled = false },
	{
		"ray-x/go.nvim",
		enabled = false,
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
			"nvim-treesitter/nvim-treesitter",
		},
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
	},
	{ "stevearc/oil.nvim" },
	{
		"nvimdev/lspsaga.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		enabled = false,
		main = "ibl",
		opts = {
			indent = {
				char = "▏", -- This is a slightly thinner char than the default one, check :help ibl.config.indent.char
			},
			scope = {
				show_start = false,
				show_end = false,
			},
		},
	},
	{ "echasnovski/mini.indentscope", enabled = false, version = "*", opts = { draw = { delay = 0 } } },
	-- Utils
	{ "folke/zen-mode.nvim" },
	{
		"j-hui/fidget.nvim",
		opts = {},
	},
	{
		"max397574/better-escape.nvim",
		opts = {
			mapping = { "jk", "kj" }, -- a table with mappings to use
			timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
			-- TODO: not working
			clear_empty_lines = false, -- clear line after escaping if there is only whitespace
		},
	},
	{
		"ggandor/leap.nvim",
		enabled = false,
		config = function()
			require("leap").create_default_mappings()
		end,
		opts = {},
	},
	{ "RRethy/vim-illuminate", enabled = false },
	{ "nvim-telescope/telescope-fzf-native.nvim" },
	{
		"windwp/nvim-ts-autotag",
		opts = {},
	},
	{
		"zbirenbaum/copilot.lua",
		event = "InsertEnter",
		opts = {
			panel = {
				enabled = true,
				size = 10,
				border = true,
				position = "bottom",
			},
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<Del>",
					next = "<S-Down>",
					prev = "<S-Up>",
					accept_word = "<S-Del>",
					dismiss = "<C-Del>",
				},
			},
		},
	},
	{
		"zbirenbaum/copilot-cmp",
		enabled = false,
		event = { "InsertEnter", "LspAttach" },
		opts = {
			fix_pairs = true,
		},
		-- config = {}
	},
	{ "ThePrimeagen/vim-be-good" },
	{ "HiPhish/rainbow-delimiters.nvim", enabled = false },
	{ "akinsho/toggleterm.nvim" },
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{
		"folke/flash.nvim",
		enabled = false,
		event = "VeryLazy",
		opts = {},
  -- stylua: ignore
  keys = {
    { "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "<leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
	},
	{
		"junegunn/limelight.vim",
		config = function()
			vim.g.limelight_conceal_ctermfg = "gray"
			vim.g.limelight_conceal_ctermfg = 240
			vim.g.limelight_conceal_guifg = "DarkGray"
			vim.g.limelight_conceal_guifg = "#777777"
			vim.keymap.set("n", "<leader>l", "<cmd>Limelight!!<cr>", { noremap = true, silent = true })
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
	},
	{ "tpope/vim-fugitive" },
	{ "vimwiki/vimwiki" },
	-- { "wellle/context.vim" },
	{
		"nvim-tree/nvim-tree.lua",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "<leader>e", mode = { "n" }, "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true } },
			{ "n", "<leader>E", "<cmd>NvimTreeFindFile<cr>", { noremap = true, silent = true } },
		},
	},
}, {})
