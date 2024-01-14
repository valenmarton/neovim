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
  {
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    name = "rose-pine",
    opts = {
      styles = {
        -- italic = false,
        transparency = true
      },
    },
    -- this rungs before opts :(
    -- config = function()
    --   vim.cmd([[colorscheme rose-pine]])
    -- end
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
          italic = false
        }
      }
    },
  },
  -- Search
  { "nvim-telescope/telescope.nvim" },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
    }
  },
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  {
    'L3MON4D3/LuaSnip',
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    -- enabled = false,
    -- FIX: snippets not working
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- config = function()
      --   require("luasnip.loaders.from_vscode").lazy_load()
      -- end,
    },
  },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-cmdline' },
  { 'saadparwaiz1/cmp_luasnip' },
  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  {
    'numToStr/Comment.nvim',
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      opts = {
        enable_autocmd = false,
      }
    },
    config = function()
      require('Comment').setup {
        pre_hook = function()
          return vim.bo.commentstring
        end
      }
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
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
  -- { 'machakann/vim-sandwich' },
  "tpope/vim-surround",
  {
    -- enabled = false,
    'stevearc/dressing.nvim',
    event = "VeryLazy",
    opts = {},
  },
  { 'ThePrimeagen/harpoon' },
  { 'mbbill/undotree' },
  {
    "onsails/lspkind.nvim"                            -- cmp icons
  },
  { "nvim-lualine/lualine.nvim",   enabled = false }, -- statusbar under
  { 'nvim-tree/nvim-web-devicons', lazy = true },
  { 'lewis6991/gitsigns.nvim' },
  -- TODO:
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      signs = false
    }
  },
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    init = function() vim.g.mkdp_filetypes = { "markdown" } end
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      action_keys = {
        open_tab = { "<c-&>" },
      }
    },
  },
  { 'akinsho/bufferline.nvim',  version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'tjdevries/colorbuddy.nvim' },
  {
    "ray-x/go.nvim",
    enabled = false,
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
  },
  { "stevearc/oil.nvim" },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    }
  },
  { "lukas-reineke/indent-blankline.nvim", enabled = false, main = "ibl",                   opts = {} },
  { "echasnovski/mini.indentscope",        version = "*",   opts = { draw = { delay = 0 } } },
  -- Utils
  { "folke/zen-mode.nvim" },
  {
    "j-hui/fidget.nvim",
    opts = {}
  },
  {
    'max397574/better-escape.nvim',
    opts = {
      mapping = { "jk", "kj" },   -- a table with mappings to use
      timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
      -- TODO: not working
      clear_empty_lines = false,  -- clear line after escaping if there is only whitespace
    }
  },
  {
    "ggandor/leap.nvim",
    config = function()
      require('leap').create_default_mappings()
    end,
    opts = {

    }
  },
  { "RRethy/vim-illuminate" },
  { "nvim-telescope/telescope-fzf-native.nvim" },
  {
    "windwp/nvim-ts-autotag",
    opts = {}
  },
  {
    "zbirenbaum/copilot.lua",
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
        },
      },
    },
    event = "InsertEnter"
  },
  {
    "zbirenbaum/copilot-cmp",
    enabled = false,
    event = { "InsertEnter", "LspAttach" },
    opts = {
      fix_pairs = true
    },
    -- config = {}
  },
}, opts)
