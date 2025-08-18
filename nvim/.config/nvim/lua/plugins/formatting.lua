return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters = {
        ["biome-organize-imports"] = {
          condition = function()
            return vim.fs.find({ "biome.json", "biome.jsonc" }, { upward = true })[1]
          end,
        },
        ["biome"] = {
          condition = function()
            return vim.fs.find({ "biome.json", "biome.jsonc" }, { upward = true })[1]
          end,
        },
        ["prettierd"] = {
          condition = function()
            return vim.bo.filetype == "markdown"
              or vim.fs.find({
                ".prettierrc",
                ".prettierrc.json",
                ".prettierrc.js",
                "prettier.config.js",
              }, { upward = true })[1]
          end,
        },
      },
      formatters_by_ft = {
        javascript = { "biome-organize-imports", "biome", "prettierd" },
        typescript = { "biome-organize-imports", "biome", "prettierd" },
        javascriptreact = { "biome-organize-imports", "biome", "prettierd" },
        typescriptreact = { "biome-organize-imports", "biome", "prettierd" },
        css = { "biome-organize-imports", "biome", "prettierd" },
        html = { "prettierd" },
        json = { "biome-organize-imports", "biome", "prettierd" },
        yaml = { "prettierd" },
        markdown = { "prettierd" },
        lua = { "stylua" },
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
    })

    vim.keymap.set({ "n", "v" }, "<leader>mp", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
