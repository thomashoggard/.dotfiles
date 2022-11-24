vim.g.mapleader = " "
vim.g.maplocalleader = " "


vim.keymap.set("i", "jk", "<Esc>")

-- Strong left & right
vim.keymap.set("n", "H", "_")
vim.keymap.set("n", "L", "&")

-- Window
vim.keymap.set("n", "<Up>", ":resize +4<CR>", { silent = true })
vim.keymap.set("n", "<Down>", ":resize -4<CR>", { silent = true })
vim.keymap.set("n", "<Right>", ":vertical resize -10<CR>", { silent = true })
vim.keymap.set("n", "<Left>", ":vertical resize +10<CR>", { silent = true })

-- Buffers
vim.keymap.set("n", "<leader>q", ":Bwipeout<CR>")

-- Undo
vim.keymap.set('n', "<F5>", ":MundoToggle<CR>", { silent = true })

-- Files & Search
vim.keymap.set("n", "<C-f>", ":silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", { silent = true })
vim.keymap.set("n", "<leader>r", ":NvimTreeRefresh<CR>", { silent = true })
vim.keymap.set("n", "<leader>n", ":NvimTreeFindFile<CR>", { silent = true })
vim.keymap.set("n", "<leader>e", ":!open %:p:h<CR>", { silent = true })
vim.keymap.set("n", "<leader>ms", require("nvim-tree.marks.navigation").select)


-- Find files using Telescope command-line sugar.
vim.keymap.set("n", "<C-p>", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers)
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
-- Takes current selection and puts into telescope
vim.keymap.set("v", "<leader>fg", '"zy:Telescope live_grep default_text=<C-r>z<cr>', { silent = true })

-- Make current file executable
vim.keymap.set("n", "<leader>x", ":!chmod +x %<CR>")

-- quick fix list
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

-- Git
-- vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>")
-- vim.keymap.set("n", "<leader>gs", ":Git<CR>")
-- vim.keymap.set("n", "<leader>gl", ":Git log<CR>")
-- vim.keymap.set("n", "<leader>gc", ":Git commit<CR>")
-- vim.keymap.set("n", "<leader>gb", ":Git switch")
-- vim.keymap.set("n", "<leader>gp", ":Git push<CR>")
-- vim.keymap.set("n", "<leader>gP", ":Git pull<CR>")
-- vim.keymap.set("n", "<leader>gd", ":Gvdiffsplit!<CR>")
-- vim.keymap.set("n", "<leader>gf", ":diffget //2<CR>")
-- vim.keymap.set("n", "<leader>gj", ":diffget //3<CR>")
vim.keymap.set("n", "<leader>gg", ":Neogit<CR>")
vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>gD", ":DiffviewOpen main<CR>")
vim.keymap.set("n", "<leader>gl", ":Neogit log<CR>")
vim.keymap.set("n", "<leader>gp", ":Neogit push<CR>")

-- Movement
vim.keymap.set("n", "<leader>fw", ":HopWord<CR>", { silent = true })

-- Tabs
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>ts", ":tab new<CR>", { silent = true })
vim.keymap.set("n", "<leader>tt", ":tab split<CR>", { silent = true })

-- Code Actions
vim.keymap.set("n", "<leader>a", ":CodeActionMenu<CR>", { silent = true })

-- Floating Terminal
vim.keymap.set('n', '<A-i>', '<CMD>lua require("FTerm").toggle()<CR>')
vim.keymap.set('t', '<A-i>', '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
