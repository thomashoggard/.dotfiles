return {
  {
    "L3MON4D3/LuaSnip",
    config = function()
      local ls = require("luasnip")

      require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/snippets" }) -- Load custom snippets
      require("luasnip.loaders.from_snipmate").lazy_load({ paths = "~/.config/nvim/snippets" }) -- Load custom snippets

      -- Edit snippets within the current session.
      vim.cmd([[command! LuaSnipEdit <cmd>lua require("luasnip.loaders").edit_snippet_files()]])
      vim.keymap.set("n", "<Leader><Leader>s", "<cmd>LuaSnipEdit<cr>", { silent = true, noremap = true })

      ls.config.setup({ store_selection_keys = "<Leader>s" })

      ls.filetype_extend("NeogitCommitMessage", { "gitcommit" })
      ls.filetype_extend("typescript", { "javascript" })
      ls.filetype_extend("typescriptreact", { "typescript", "javascript" })
    end,
  },
}
