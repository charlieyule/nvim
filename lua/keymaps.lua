vim.g.mapleader = " "

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

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
