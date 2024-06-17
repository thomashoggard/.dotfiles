return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      { "williamboman/mason-lspconfig.nvim" },
      { "WhoIsSethDaniel/mason-tool-installer.nvim" },
    },
    config = function()
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")

      mason.setup({
        ui = {
          border = "rounded",
        },
      })

      mason_lspconfig.setup({
        ensure_installed = {
          "tsserver",
          "bashls",
          "jsonls",
          "lua_ls",
          "html",
          -- "eslint",
        },
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "prettierd",
          "eslint_d",
          "codespell",
          "stylua",
        },
      })
    end,
  },
}
