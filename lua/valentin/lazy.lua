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
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-telescope/telescope.nvim",
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'hrsh7th/cmp-nvim-lsp-signature-help' },
      { 'L3MON4D3/LuaSnip' },     -- Required{'hrsh7th/cmp-buffer'},
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-buffer' },
    }
  },
  -- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  { 'akinsho/toggleterm.nvim',         version = "*",      config = true },
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {}
  },
  -- TODO: autotag ?
  { 'machakann/vim-sandwich' }, --minimal surrounding 's{action}{motion}{char}'
  {
    "tpope/vim-surround"        --also surrounding with tags '{action}{motion}{char/s}'
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  { 'ThePrimeagen/harpoon' },
  { 'mbbill/undotree' },
  -- TODO: DO I NEED fancy stuff
  {
    "onsails/lspkind.nvim"         -- cmp icons
  },
  { "nvim-lualine/lualine.nvim" }, -- statusbar under
  {
    'nvim-tree/nvim-web-devicons'
  },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  { 'lewis6991/gitsigns.nvim' },
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
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  -- {
  --   'svrana/neosolarized.nvim',
  --   comment_italics = true,
  --   background_set = false,
  --   lazy = false
  -- },
  {
    "Tsuzat/NeoSolarized.nvim",
    name = "neosol",
    lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- vim.cmd [[ colorscheme NeoSolarized ]]
    end,
    opts = {
      transparent = true
    },
  },
  { 'akinsho/bufferline.nvim',  version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'tjdevries/colorbuddy.nvim' },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      styles = {
        keywords = {
          italic = false
        }
      }
    },
  },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = false },
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    -- config = function()
    --   require("go").setup()
    -- end,
    event = { "CmdlineEnter" },
    ft = { "go", 'gomod' },
  },
  { "stevearc/oil.nvim" },
  { "ggandor/leap.nvim" },
  { "karb94/neoscroll.nvim" },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,       desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,     desc = "Remote Flash" },
      {
        "R",
        mode = { "o", "x" },
        function() require("flash").treesitter_search() end,
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        mode = { "c" },
        function() require("flash").toggle() end,
        desc =
        "Toggle Flash Search"
      },
    },
  },
  {
    "nvimdev/lspsaga.nvim",
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons'
    }
  },
  { "lukas-reineke/indent-blankline.nvim" }
  -- lazy.nvim
  -- {
  --   "folke/noice.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
  --     "MunifTanjim/nui.nvim",
  --     -- OPTIONAL:
  --     --   `nvim-notify` is only needed, if you want to use the notification view.
  --     --   If not available, we use `mini` as the fallback
  --     "rcarriga/nvim-notify",
  --   }
  -- }
  ,
  { "ellisonleao/gruvbox.nvim" },
  { "folke/zen-mode.nvim" },
  { "catppuccin/nvim",         name = "catppuccin", priority = 1000 }
}, opts)
