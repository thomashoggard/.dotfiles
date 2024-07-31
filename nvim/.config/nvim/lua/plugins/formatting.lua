return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "biomejs", "prettierd", stop_after_first = true },
        typescript = { "biomejs", "prettierd", stop_after_first = true },
        javascriptreact = { "biomejs", "prettierd", stop_after_first = true },
        typescriptreact = { "biomejs", "prettierd", stop_after_first = true },
        css = { "prettierd" },
        html = { "prettierd" },
        json = { "biomejs", "prettierd", stop_after_first = true },
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
