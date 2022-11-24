vim.g.catppuccin_flavour = "mocha"

local colors = require("catppuccin.palettes").get_palette()
local catppuccin = require("catppuccin")

catppuccin.setup({
  -- custom_highlights = {
  --   VertSplit = { fg = colors.pink },
  -- },
  -- transparent_background = false,
  term_colors = true,
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
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

-- Default theme
vim.cmd [[colorscheme catppuccin]]

function light()
  vim.o.background = "light"
  vim.cmd [[colorscheme gruvbox-material]]
end

function dark()
  vim.o.background = "dark"
  vim.cmd [[colorscheme catppuccin]]
end

vim.cmd("command Light silent lua light()")
vim.cmd("command Dark silent lua dark()")


-- require('onedark').setup {
--   style = 'deep'
-- }
-- vim.cmd([[colorscheme onedark]])

-- require('onedarkpro').setup({
--   dark_theme = 'onedark_dark'
-- })

vim.g.everforest_background = "hard"

-- Set git merge marker highlights - See :h diff.txt
vim.api.nvim_set_hl(0, 'DiffText', { fg = "#ffffff", bg = "#1d3b40" })
vim.api.nvim_set_hl(0, 'DiffAdd', { fg = "#ffffff", bg = "#1d3450" })
