vim.g.languages = {
  go = os.getenv("NVIM_LANGUAGE_GO"),
}

if vim.g.languages.go then
  require("languages.go")
end

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
    "--branch=stable",
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
    url_format = "git@github.com:/%s.git",
  },
})

vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
