return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")

      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets" }) -- Load custom snippets

      vim.cmd([[command! LuaSnipEdit :lua require("luasnip.loaders.from_lua").edit_snippet_files()]])

      vim.keymap.set("n", "<Leader><Leader>s", "<cmd>LuaSnipEdit<cr>", { silent = true, noremap = true })

      ls.filetype_extend("NeogitCommitMessage", { "gitcommit" })
      ls.filetype_extend("typescript", { "javascript" })
      ls.filetype_extend("typescriptreact", { "typescript", "javascript" })
    end
  }
}
