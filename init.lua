-- vim options
require("options")

-- vim keymaps
require("keymaps")

-- lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- plugin installations
require("lazy").setup("plugins", {
  defaults = {
    lazy = true,
    version = "*",
  },
  git = {
    url_format = "git@github.com:/%s.git"
  }
})

-- plugin setups
require("setups.init")
