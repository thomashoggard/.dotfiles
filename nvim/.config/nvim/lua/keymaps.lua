vim.keymap.set("i", "jk", "<Esc>")

-- TODO: Add ability to switch between buffers quickly, maybe like how we do the quick fix list?

-- Strong left & right
vim.keymap.set({ "n", "v" }, "H", "_")
vim.keymap.set({ "n", "v" }, "L", "g_")

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
-- copy current line without leading/trailing whitespace into clipboard.
vim.keymap.set("n", "<leader>yl", ':norm _vg_"+y<CR>')
-- copy current line without leading/trailing whitespace.
vim.keymap.set("n", "yl", ':norm _vg_y<CR>')

-- Tabs
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>tn", ":tab new<CR>", { silent = true })
vim.keymap.set("n", "<leader>ts", ":tab split<CR>", { silent = true })
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>tp", ":tabprevious<CR>", { silent = true })

-- Keep cursor in-place when using joining lines.
vim.keymap.set("n", "J", "mzJ`z");

-- Center when jumping down or up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Trouble
vim.keymap.set("n", "<leader>d", ":TroubleToggle<CR>")
