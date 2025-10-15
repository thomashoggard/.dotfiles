return {
  {
    "mason-org/mason.nvim",
    dependencies = {
      { "mason-org/mason-lspconfig.nvim" },
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
          "ts_ls",
          "bashls",
          "jsonls",
          "lua_ls",
          "html",
          "eslint",
          "biome",
          "yamlls",
        },
        handlers = {
          ["pkl-lsp"] = function()
            require("lspconfig").pkl_lsp.setup(require("lsp.pkl_lsp"))
          end,
        },
      })

      mason_tool_installer.setup({
        ensure_installed = {
          "prettierd",
          "stylua",
          "js-debug-adapter",
        },
      })
    end,
  },
}
