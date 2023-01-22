-- :help options
local o = vim.opt

o.clipboard = "unnamedplus"
o.completeopt:append({ "menuone", "noselect" })
o.cursorline = true
o.mouse = "a"
o.number = true
o.relativenumber = true
o.scrolloff = 10
o.expandtab = true
o.shiftwidth = 2
o.showtabline = 2
o.splitbelow = true
o.splitright = true
o.wrap = false
o.iskeyword:append("-")
o.updatetime = 250
