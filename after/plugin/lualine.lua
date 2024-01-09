require('lualine').setup({
  -- options = { theme = 'solarized_dark' },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1
      }
    }
  },
  inactive_sections = {
    lualine_c = {
      {
        'filename',
        path = 1
      }
    }
  },
  tabline = {
    -- lualine_x = {
    --   'vim.fn.getcwd()'
    -- }
  }
})

-- vim.cmd('colorscheme gruvbox')
