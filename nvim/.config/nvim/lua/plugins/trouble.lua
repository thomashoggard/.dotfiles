-- Show linting errors in a panel
return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  keys = {
    {
      "<leader>d",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    },
  },
  opts = {},
}
