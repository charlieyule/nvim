local nmap = require("utils.keymap").nmap
local language_servers = require("languages.global").language_servers

local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

local lsp_keymaps = function(bufnr)
  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame", bufnr)
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", bufnr)
  nmap("<leader>fm", vim.lsp.buf.format, "[F]or[m]at", bufnr)

  nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition", bufnr)
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences", bufnr)
  nmap("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation", bufnr)
  nmap("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition", bufnr)
  nmap("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols", bufnr)
  nmap("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols", bufnr)

  -- See `:help K` for why this keymap
  nmap("K", vim.lsp.buf.hover, "Hover Documentation", bufnr)
  nmap("<C-k>", vim.lsp.buf.signature_help, "Signature Documentation", bufnr)

  -- Lesser used LSP functionality
  nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration", bufnr)
  nmap("<leader>wa", vim.lsp.buf.add_workspace_folder, "[W]orkspace [A]dd Folder", bufnr)
  nmap("<leader>wr", vim.lsp.buf.remove_workspace_folder, "[W]orkspace [R]emove Folder", bufnr)
  nmap("<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, "[W]orkspace [L]ist Folders", bufnr)
end
local on_attach = function(_, bufnr)
  lsp_keymaps(bufnr)
end

for _, options in pairs(language_servers) do
  if options.capabilities == nil then
    options.capabilities = capabilities
  end
  if options.on_attach == nil then
    options.on_attach = on_attach
  end
end

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
