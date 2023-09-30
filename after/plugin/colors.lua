require('rose-pine').setup({
  disable_background = true,
  disable_italics = true,
  dim_nc_background = false,
  disable_float_background = true,
  groups = {
    background = 'base',
    background_nc = '_experimental_nc',
    panel = 'surface',
    panel_nc = 'base',
    border = 'highlight_med',
    comment = 'muted',
    link = 'iris',
    punctuation = 'subtle',

    error = 'love',
    hint = 'iris',
    info = 'foam',
    warn = 'gold',

    headings = {
      h1 = 'iris',
      h2 = 'foam',
      h3 = 'rose',
      h4 = 'gold',
      h5 = 'pine',
      h6 = 'foam',
    }
    -- or set all headings at once
    -- headings = 'subtle'
  },

  highlight_groups = {
    ColorColumn = { bg = 'rose' },

    -- Blend colours against the "base" background
    CursorLine = { bg = 'foam', blend = 10 },
    StatusLine = { fg = 'love', bg = 'love', blend = 10 },

    -- By default each group adds to the existing config.
    -- If you only want to set what is written in this config exactly,
    -- you can set the inherit option:
    Search = { bg = 'gold', inherit = false },
    TelescopeBorder = { fg = "overlay", bg = "overlay" },
    TelescopeNormal = { fg = "subtle", bg = "overlay" },
    TelescopeSelection = { fg = "text", bg = "highlight_med" },
    TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
    TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

    TelescopeTitle = { fg = "base", bg = "love" },
    TelescopePromptTitle = { fg = "base", bg = "pine" },
    TelescopePreviewTitle = { fg = "base", bg = "iris" },

    TelescopePromptNormal = { fg = "text", bg = "surface" },
    TelescopePromptBorder = { fg = "surface", bg = "surface" },
  },

})

vim.cmd('colorscheme rose-pine')

function ColorMyPencils(color)
  color = color or "rose-pine"

  vim.cmd.colorscheme(color)

  --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- ColorMyPencils()
