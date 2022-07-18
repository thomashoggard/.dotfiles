local colors = require("catppuccin.palettes").get_palette()
local catppuccin = require("catppuccin")

catppuccin.setup({
  custom_highlights = {
    VertSplit = { fg = colors.pink },
  },
  -- transparent_background = false,
  term_colors = true,
  -- styles = {
  --   comments = "italic",
  --   conditionals = "italic",
  --   loops = "NONE",
  --   functions = "NONE",
  --   keywords = "NONE",
  --   strings = "NONE",
  --   variables = "NONE",
  --   numbers = "NONE",
  --   booleans = "NONE",
  --   properties = "NONE",
  --   types = "NONE",
  --   operators = "NONE",
  -- },
  integrations = {
    lsp_trouble = true,
    cmp = true,
    lsp_saga = true,
    neogit = true,
    markdown = true,
    ts_rainbow = true,
    hop = true,
  }
})

-- vim.g.catppuccin_flavour = "mocha"
vim.cmd [[colorscheme catppuccin]]

-- require('onedark').setup {
--   style = 'deep'
-- }
-- vim.cmd([[colorscheme onedark]])

-- require('onedarkpro').setup({
--   dark_theme = 'onedark_dark'
-- })

-- vim.g.everforest_background = "hard"
-- vim.cmd([[colorscheme everforest]])

-- Set git merge marker highlights - See :h diff.txt
vim.api.nvim_set_hl(0, 'DiffText', { fg = "#ffffff", bg = "#1d3b40" })
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = "#ffffff", bg = "#1d3450" })

-- Unset diff highlight groups
-- DiffChange
-- DiffDelete
