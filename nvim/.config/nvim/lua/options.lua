vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.relativenumber = true -- Show relative line numbers
opt.number = true -- Show line numbers in the gutter
opt.wrap = false -- Disable text wrap
opt.cursorline = true -- highlight the line containing the cursor
opt.termguicolors = true
opt.laststatus = 3 -- Enable the global statusline
opt.signcolumn = "yes" -- Always draw the sign column
opt.mouse = "a" -- Enable mouse scrolling
opt.ignorecase = true -- Make searching case insensitive
opt.smartcase = true -- ^unless the query has capital letters
opt.splitright = true -- Split new vertical windows to the right
opt.splitbelow = true -- Split new horizontal windows to the bottom
opt.expandtab = true -- Convert tabs to spaces.
opt.shiftwidth = 2
opt.tabstop = 2
opt.softtabstop = 2
opt.scrolloff = 12
opt.smartindent = true
opt.autoindent = true
opt.completeopt = "menu,menuone,noselect"
opt.swapfile = false
opt.spell = true
opt.pumheight = 10 -- Maximum number of items to show in popups (cmp)
opt.fillchars:append('diff:╱')
