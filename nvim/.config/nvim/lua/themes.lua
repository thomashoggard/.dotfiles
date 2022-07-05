local colors = require 'catppuccin.api.colors'.get_colors() -- fetch colors with API
local catppuccin = require("catppuccin")

catppuccin.setup({
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
    -- treesitter = true,
    -- native_lsp = {
    --   enabled = true,
    --   virtual_text = {
    --     errors = "italic",
    --     hints = "italic",
    --     warnings = "italic",
    --     information = "italic",
    --   },
    --   underlines = {
    --     errors = "underline",
    --     hints = "underline",
    --     warnings = "underline",
    --     information = "underline",
    --   },
    -- },
    lsp_trouble = true,
    cmp = true,
    lsp_saga = false,
    -- gitgutter = false,
    gitsigns = true,
    telescope = true,
    -- nvimtree = {
    --   enabled = true,
    --   show_root = false,
    --   transparent_panel = false,
    -- },
    -- neotree = {
    --   enabled = false,
    --   show_root = false,
    --   transparent_panel = false,
    -- },
    -- which_key = false,
    -- indent_blankline = {
    --   enabled = true,
    --   colored_indent_levels = false,
    -- },
    -- dashboard = true,
    -- neogit = false,
    -- vim_sneak = false,
    -- fern = false,
    -- barbar = false,
    bufferline = true,
    markdown = true,
    -- lightspeed = false,
    ts_rainbow = true,
    hop = true,
    notify = true,
    -- telekasten = false,
    symbols_outline = true,
  }
})

catppuccin.remap({
  VertSplit = { fg = colors.pink },
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
