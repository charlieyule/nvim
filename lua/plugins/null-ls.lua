return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics
    require("null-ls").setup({
      sources = {
        -- Lua
        formatting.stylua.with({
          extra_args = {
            "--indent-type=Spaces",
            "--indent-width=2",
          },
        }),
        -- Go
        formatting.gofumpt,
        diagnostics.staticcheck,
      },
    })
  end,
  lazy = false,
}
