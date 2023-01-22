vim.g.languages = {
  go = false,
  markdown = false,
}

for language, enable in pairs(vim.g.languages) do
  if enable or os.getenv("NVIM_LANGUAGE_" .. string.upper(language)) then
    require("languages." .. language)
  end
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
