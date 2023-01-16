return {
  {
    -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      local formatting = null_ls.builtins.formatting
      local code_actions = null_ls.builtins.code_actions

      null_ls.setup({
        sources = {
          formatting.shfmt,
          formatting.prettierd,
          code_actions.eslint_d,
        },
      })
    end,
  }
}
