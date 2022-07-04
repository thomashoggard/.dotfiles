local ls = require("luasnip")

require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" }) -- Load custom snippets

vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])

vim.keymap.set("n", "<Leader><Leader>s", "<cmd>LuaSnipEdit<cr>", { silent = true, noremap = true })

-- ls.config.set_config({
--   -- asdfasdf
-- })
