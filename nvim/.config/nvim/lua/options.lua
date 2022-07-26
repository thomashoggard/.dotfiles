-- Visual
vim.o.relativenumber = true -- Show relative line numbers
vim.o.number = true -- Show line numbers in the gutter
vim.o.wrap = false -- Disable text wrap
vim.o.cursorline = true -- highlight the line containing the cursor
vim.o.termguicolors = true
vim.o.laststatus = 3 -- Enable the global statusline
vim.wo.signcolumn = "yes" -- Always draw the sign column

-- Behaviour
vim.o.mouse = "a" -- Enable mouse scrolling
vim.o.ignorecase = true -- Make searching case insensitive
vim.o.smartcase = true -- ^unless the query has capital letters
vim.o.splitright = true -- Split new vertical windows to the right
vim.o.splitbelow = true -- Split new horizontal windows to the bottom
vim.o.expandtab = true -- Convert tabs to spaces.
vim.o.shiftwidth = 2
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.scrolloff = 12
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.swapfile = false
vim.o.spell = true
vim.o.pumheight = 30 -- Maximum number of items to show in popups (cmp)

vim.opt.fillchars:append('diff:╱')
