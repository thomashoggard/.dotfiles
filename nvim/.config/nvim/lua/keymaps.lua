vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("i", "jk", "<Esc>")

-- TODO: Add ability to switch between buffers quickly, maybe like how we do the quick fix list?

-- Strong left & right
vim.keymap.set({ "n", "v" }, "H", "_")
vim.keymap.set({ "n", "v" }, "L", "g_")

-- TODO: Currently C-k and C-j are already bound.
-- Move to window using the <ctrl> hjkl keys
-- vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
-- vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
-- vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
-- vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Files & Search
vim.keymap.set("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>")
-- vim.keymap.set("n", "<leader>e", ":!open %:p:h<CR>", { silent = true })

-- Quick Fix list
vim.keymap.set("n", "<C-c>", ":cclose<CR>")
vim.keymap.set("n", "<C-j>", ":cnext<CR>")
vim.keymap.set("n", "<C-k>", ":cprev<CR>")

-- Move lines up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Copy & Paste
vim.keymap.set("n", "<leader>p", "o<esc>Pk<CR>")
vim.keymap.set("v", "<leader>p", '"_dP')
vim.keymap.set({ "v", "n" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", 'gg"+yG')

-- Tabs
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>ts", ":tab new<CR>", { silent = true })
vim.keymap.set("n", "<leader>tt", ":tab split<CR>", { silent = true })
