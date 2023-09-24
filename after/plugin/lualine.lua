require('lualine').setup({
  -- options = { theme = 'solarized_dark' },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1
      }
    }
  }
})
