vim.keymap.set("i", "jk", "<Esc>")

-- Strong left & right
vim.keymap.set({ "n", "v" }, "H", "_")
vim.keymap.set({ "n", "v" }, "L", "g_")

-- Files & Search
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>")
-- vim.keymap.set("n", "<leader>e", ":!open %:p:h<CR>", { silent = true })

-- Quick Fix list
vim.keymap.set("n", "<C-c>", "<cmd>cclose<CR>")
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>")

-- Move lines up or down
vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv")

-- Copy & Paste
vim.keymap.set("n", "<leader>p", "o<esc>Pk<CR>")
vim.keymap.set("v", "<leader>p", '"_dP')
vim.keymap.set({ "v", "n" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", 'gg"+yG')
-- copy current line without leading/trailing whitespace into clipboard.
vim.keymap.set("n", "<leader>yl", '<cmd>norm _vg_"+y<CR>')
-- copy current line without leading/trailing whitespace.
vim.keymap.set("n", "yl", "<cmd>norm _vg_y<CR>")

-- Tabs
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>tt", "<cmd>tab new<CR>", { silent = true })
vim.keymap.set("n", "<leader>ts", "<cmd>tab split<CR>", { silent = true })
vim.keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { silent = true })
vim.keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>", { silent = true })

-- Keep cursor in-place when using joining lines.
vim.keymap.set("n", "J", "mzJ`z")

-- Center when jumping down or up
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
