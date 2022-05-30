require("catppuccin").setup({
  -- transparent_background = false,
  term_colors = false,
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

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd [[colorscheme catppuccin]]

-- vim.g.everforest_background = "hard"
-- vim.cmd([[colorscheme everforest]])


--
-- vim.g.tokyonight_style = "night"
-- vim.cmd[[colorscheme tokyonight]]

-- vim.cmd[[colorscheme kanagawa]]

-- require('ayu').setup({
--   mirage = false,
-- })
--
-- vim.cmd[[colorscheme ayu]]
-- vim.cmd[[colorscheme ayu-light]]

-- vim.cmd[[colorscheme duskfox]]
-- vim.cmd[[colorscheme nordfox]]
-- Nightfox
-- Dayfox
-- Dawnfox
-- Duskfox
-- Nordfox
-- Terafox

-- vim.cmd[[colorscheme gruvbox-material]]
