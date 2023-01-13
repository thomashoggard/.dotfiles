---@diagnostic disable-next-line: lowercase-global
function light()
  vim.o.background = "light"
  vim.cmd [[colorscheme gruvbox-material]]
end

---@diagnostic disable-next-line: lowercase-global
function dark()
  vim.o.background = "dark"
  vim.cmd [[colorscheme catppuccin]]
end

vim.cmd("command Light silent lua light()")
vim.cmd("command Dark silent lua dark()")

return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
    opts = {
      flavour = "mocha",
      term_colors = true,
      integrations = {
        hop = true,
        lsp_trouble = true,
        neogit = true,
      }
    }
  },
  {
    "sainnhe/gruvbox-material"
  },
  {
    "sainnhe/everforest",
    config = function()
      vim.g.everforest_background = "hard"
    end,
  }
}
