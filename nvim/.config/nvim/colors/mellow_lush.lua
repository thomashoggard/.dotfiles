vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end
vim.o.termguicolors = true
vim.g.colors_name = "mellow_lush"

-- Terminal colors (Mellow dark palette)
vim.g.terminal_color_0 = "#27272a"
vim.g.terminal_color_1 = "#f5a191"
vim.g.terminal_color_2 = "#90b99f"
vim.g.terminal_color_3 = "#e6b99d"
vim.g.terminal_color_4 = "#aca1cf"
vim.g.terminal_color_5 = "#e29eca"
vim.g.terminal_color_6 = "#ea83a5"
vim.g.terminal_color_7 = "#c1c0d4"
vim.g.terminal_color_8 = "#353539"
vim.g.terminal_color_9 = "#ffae9f"
vim.g.terminal_color_10 = "#9dc6ac"
vim.g.terminal_color_11 = "#f0c5a9"
vim.g.terminal_color_12 = "#b9aeda"
vim.g.terminal_color_13 = "#ecaad6"
vim.g.terminal_color_14 = "#f591b2"
vim.g.terminal_color_15 = "#cac9dd"
vim.g.terminal_color_background = "#161617"
vim.g.terminal_color_foreground = "#c9c7cd"

require("lush")(require("lush_theme.mellow_lush"))
