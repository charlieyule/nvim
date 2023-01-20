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

local null_ls_sources = {
  formatting = {
    stylua = {
      extra_args = {
        "--indent-type=Spaces",
        "--indent-width=2",
      },
    },
  },
  diagnostics = {},
  code_actions = {},
}

local telescope_ignore_patterns = {}

-- Avaiable language server options
-- :help lspconfig-setup
--
-- Language server List:
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local function add_language_server(name, options)
  language_servers[name] = options or {}
end

-- type: "formatting" | "diagnostics" | "code_actions"
-- Avaiable source:
-- :NullLsInfo
local function add_null_ls_source(type, name, options)
  null_ls_sources[type][name] = options or {}
end

local function add_telescope_ingore_pattern(pattern)
  table.insert(telescope_ignore_patterns, pattern)
end

return {
  language_servers = language_servers,
  null_ls_sources = null_ls_sources,
  telescope_ignore_patterns = telescope_ignore_patterns,
  add_language_server = add_language_server,
  add_null_ls_source = add_null_ls_source,
  add_telescope_ingore_pattern = add_telescope_ingore_pattern,
  FORMATTING = "formatting",
  DIAGNOSTICS = "diagnostics",
  CODE_ACTIONS = "code_actions",
}
