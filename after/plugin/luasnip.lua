-- friendli snippets through luasnip
require("luasnip.loaders.from_vscode").lazy_load()
require 'luasnip'.filetype_extend("typescript", { "angular" })
require 'luasnip'.filetype_extend("html", { "angular" })
