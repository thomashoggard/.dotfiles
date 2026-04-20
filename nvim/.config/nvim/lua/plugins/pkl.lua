return {
  "apple/pkl-neovim",
  lazy = true,
  ft = "pkl",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  build = function()
    require("pkl-neovim").init()
    require("nvim-treesitter").install({ "pkl" }):wait(300000)
  end,
  config = function()
    vim.g.pkl_neovim = {
      start_command = { "pkl-lsp" },
      pkl_cli_path = "pkl",
    }
  end,
}
