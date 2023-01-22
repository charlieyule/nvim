local keymap = require("utils.keymap")

vim.g.mapleader = " "

keymap.nmap("<C-t>", "<C-w>v")
keymap.nmap("<C-h>", "<C-w>h")
keymap.nmap("<C-j>", "<C-w>j")
keymap.nmap("<C-k>", "<C-w>k")
keymap.nmap("<C-l>", "<C-w>l")

keymap.imap("jk", "<ESC>")
keymap.imap("<C-h>", "<LEFT>")
keymap.imap("<C-j>", "<DOWN>")
keymap.imap("<C-k>", "<UP>")
keymap.imap("<C-l>", "<RIGHT>")
keymap.vmap("J", ":m '>+1<CR>gv=gv")
keymap.vmap("K", ":m '<-2<CR>gv=gv")

-- nvim-tree
keymap.nmap("<leader>e", ":NvimTreeToggle<CR>")

-- bufferline
keymap.nmap("<leader>bp", ":BufferLinePick<CR>")
keymap.nmap("<C-m>", ":BufferLineCycleNext<CR>")
keymap.nmap("<C-n>", ":BufferLineCyclePrev<CR>")
keymap.nmap("<leader>bm", ":BufferLineMoveNext<CR>")
keymap.nmap("<leader>bn", ":BufferLineMovePrev<CR>")
keymap.nmap("<C-w>", ":Bd<CR>")

keymap.nmap("<leader>l", "<C-w>H")
keymap.nmap("<leader>k", "<C-w>K")
