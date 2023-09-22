-- Define a function to set the current working directory to the directory of the current file
function set_cwd_to_current_file()
  local current_file = vim.fn.expand('%:p')
  local current_directory = vim.fn.fnamemodify(current_file, ':h')
  vim.fn.execute('cd ' .. vim.fn.fnameescape(current_directory))
end

-- Define an autocmd group named "cdpwd" and attach the autocmd event to "VimEnter"
vim.cmd([[
augroup cdpwd
    autocmd!
    autocmd VimEnter * lua set_cwd_to_current_file()
augroup END
]])

require("valentin.set")
require("valentin.remap")
require("valentin.lazy")


vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
