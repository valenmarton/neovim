require("oil").setup({
  view_options = {
    show_hidden = true
  },
  columns = {
    "icon",
    -- "permission",
    -- "size",
    -- "mtime",
  },
  keymaps = {
    ["<C-s>"] = "",
    ["<C-r>"] = "actions.refresh",
  }
})
