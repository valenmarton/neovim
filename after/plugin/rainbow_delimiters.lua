-- disable on html, using local rainbow_delimiters
--
local rainbow_delimiters = require 'rainbow-delimiters'

vim.g.rainbow_delimiters = {
  strategy = {
    [''] = rainbow_delimiters.strategy['local'],
    -- commonlisp = rainbow_delimiters.strategy['local'],
  },
  query = {
    [''] = 'rainbow-delimiters',
    -- lua = 'rainbow-blocks',
  },
  priority = {
    [''] = 110,
    lua = 210,
  },
  highlight = {
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterOrange',
    'RainbowDelimiterViolet',
    'RainbowDelimiterCyan',
    'RainbowDelimiterRed',
    'RainbowDelimiterGreen',
  },
  blacklist = { 'c', 'cpp', 'html' },
}
