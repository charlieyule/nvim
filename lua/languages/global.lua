local capabilities = vim.lsp.protocol.make_client_capabilities()
local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if status_ok then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

local nmap = require("utils.nmap")
local lsp_keymaps = function(bufnr)
  nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame", bufnr)
  nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", bufnr)
  nmap("<leader>fm", vim.lsp.buf.format, "[F]or[m]at", bufnr)

  nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition", bufnr)
  nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences", bufnr)
  nmap("gI", vim.lsp.buf.implementation, "[G]oto [I]mplementation", bufnr)
  nmap("<leader>D", vim.lsp.buf.type_definition, "Type [D]efinition", bufnr)
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

-- Avaiable language server fields
-- :help lspconfig-setup
--
-- Language server list:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local language_servers = {
  sumneko_lua = {
    settings = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
        diagnostics = { globals = { "vim" } },
        format = { enable = false },
      },
    },
  },
}

for _, options in pairs(language_servers) do
  if options.capabilities == nil then
    options.capabilities = capabilities
  end
  if options.on_attach == nil then
    options.on_attach = on_attach
  end
end

return {
  language_servers = language_servers,
}
