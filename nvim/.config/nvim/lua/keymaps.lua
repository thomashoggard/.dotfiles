local Utils = require('utils')

-- local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
-- local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
-- local tnoremap = Utils.tnoremap
local nmap = Utils.nmap
-- local xmap = Utils.xmap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

inoremap("jk", "<Esc>")

-- Strong left & right
nnoremap("H", "_")
nnoremap("L", "$")

-- Window
nnoremap("<Up>", ":resize +5<CR>")
nnoremap("<Down>", ":resize -5<CR>")
nnoremap("<Right>", ":vertical resize -20<CR>")
nnoremap("<Left>", ":vertical resize +20<CR>")

-- Files & Search
nnoremap("<C-f>", ":silent !tmux neww tmux-sessionizer<CR>")
nnoremap("<C-n>", ":NvimTreeToggle<CR>")
nnoremap("<leader>r", ":NvimTreeRefresh<CR>")
nnoremap("<leader>n", ":NvimTreeFindFile<CR>")

-- Find files using Telescope command-line sugar.
nnoremap("<C-p>", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")

-- Takes current selection and puts into telescope
vnoremap("<leader>fg", '"zy:Telescope live_grep default_text=<C-r>z<cr>')
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

-- Make current file executable
nnoremap("<leader>x", ":!chmod +x %<CR>")

-- Reload nvim config
nnoremap("<leader><CR>", ":so $VIM_CONFIG<CR>")

-- quickfixlist
nnoremap("<C-j>", ":cnext<CR>")
nnoremap("<C-k>", ":cprev<CR>")

-- Move lines up or down
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- Copy & Paste
nnoremap("<leader>p", "o<esc>Pk<CR>")
vnoremap("<leader>p", '"_dP')
vnoremap("<leader>y", '"+y')
nnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", 'gg"+yG')

-- Git
nmap("<leader>gs", ":Git<CR>")
nmap("<leader>gl", ":Git log<CR>")
nmap("<leader>gc", ":Git commit<CR>")
nmap("<leader>gb", ":Git switch")
nmap("<leader>gp", ":Git push<CR>")
nmap("<leader>gP", ":Git pull<CR>")
nmap("<leader>gf", ":diffget //2<CR>")
nmap("<leader>gj", ":diffget //3<CR>")
