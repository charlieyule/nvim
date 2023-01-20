local language_servers = require("languages.global").language_servers

return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  lazy = false,
  config = function()
    require("mason").setup()

    local mason_lspconfig = require("mason-lspconfig")
    mason_lspconfig.setup({
      ensure_installed = vim.tbl_keys(language_servers),
    })
    mason_lspconfig.setup_handlers({
      function(server_name)
        local setup_opts = language_servers[server_name]
        if setup_opts ~= nil then
          require("lspconfig")[server_name].setup(setup_opts)
        end
      end,
    })
  end,
}
