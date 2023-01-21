vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-t>", "<C-w>v", opts)
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("i", "jk", "<ESC>", opts)
keymap("i", "<C-h>", "<LEFT>", opts)
keymap("i", "<C-j>", "<DOWN>", opts)
keymap("i", "<C-k>", "<UP>", opts)
keymap("i", "<C-l>", "<RIGHT>", opts)
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- nvim-tree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- bufferline
keymap("n", "<leader>bp", ":BufferLinePick<CR>", opts)
keymap("n", "<C-m>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<C-n>", ":BufferLineCyclePrev<CR>", opts)
keymap("n", "<leader>bm", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<leader>bn", ":BufferLineMovePrev<CR>", opts)
keymap("n", "<C-w>", ":Bd<CR>", opts)

keymap("n", "<leader>l", "<C-w>H", opts)
keymap("n", "<leader>k", "<C-w>K", opts)
