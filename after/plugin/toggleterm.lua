require("toggleterm").setup {
  open_mapping = [[<C-\>]],
  insert_mappings = true,
  shade_terminals = false,
  direction = 'horizontal',
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return 116
    end
  end
}
