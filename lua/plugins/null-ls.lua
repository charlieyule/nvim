return {
  {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      require("null-ls").setup({
        sources = {
          formatting.stylua.with({
            extra_args = {
              "--indent-type=Spaces",
              "--indent-width=2",
            },
          }),
        },
      })
    end,
    lazy = false,
  },
}
