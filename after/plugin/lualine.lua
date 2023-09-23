require('lualine').setup({
  options = { theme = 'NeoSolarized' },
  sections = {
    lualine_c = {
      {
        'filename',
        path = 1
      }
    }
  }
})
