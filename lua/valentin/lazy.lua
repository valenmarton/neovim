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
    disable_background = true,
    disable_italics = true
  },
  "nvim-treesitter/nvim-treesitter",
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
  { 'akinsho/toggleterm.nvim', version = "*", config = true },
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
    }
  },
  {
    'iamcco/markdown-preview.nvim',
    build = 'cd app && npm install',
    init = function() vim.g.mkdp_filetypes = { "markdown" } end
  },
  {
    'f-person/git-blame.nvim',
    keys = {
      -- { "<leader>gbt", "<cmd>GitBlameToggle<cr>", desc = "GitBlameToggle" },
      config = function()
        require('gitblame').setup({ enabled = false })
      end
    }
  },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },
  {
    'svrana/neosolarized.nvim',
    comment_italics = true,
    background_set = false,
  },
  -- {
  --   "Tsuzat/NeoSolarized.nvim",
  --   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     vim.cmd [[ colorscheme NeoSolarized ]]
  --   end,
  --   opts = {
  --     transparent = true
  --   },
  -- },
  { 'akinsho/bufferline.nvim',  version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
  { 'tjdevries/colorbuddy.nvim' },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
}, opts)
