function set_cwd_to_current_file()
  local current_file = vim.fn.expand('%:p')
  local current_directory = vim.fn.fnamemodify(current_file, ':h')
  -- print(current_file)
  if string.find(current_directory, "oil") then
    current_directory = string.sub(current_directory, 7)
  end
  -- local opened_dir_without_oil_prefix = string.sub(current_directory, 7) -- Removes the first 6 characters
  print("Opened >>> " .. current_directory)
  vim.cmd('cd ' .. current_directory)
end

vim.cmd([[
 augroup cdpwd
     autocmd!
     autocmd VimEnter * lua set_cwd_to_current_file()
 augroup END
 ]])

-- vim.cmd('cd /Users/valentinmarton/Development/')

require("valentin.set")
require("valentin.remap")
require("valentin.lazy")

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
