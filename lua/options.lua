-- :help options
local o = vim.opt

o.clipboard = "unnamedplus"
o.completeopt:append { "menuone", "noselect" }
o.cursorline = true
o.expandtab = true
o.mouse = "a"
o.number = true
o.relativenumber = true
o.scrolloff = 10
o.shiftwidth = 2
o.showtabline = 2
o.splitbelow = true
o.splitright = true
o.wrap = false
o.iskeyword:append "-"
