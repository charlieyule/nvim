local sources = require("languages.global").null_ls_sources

return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    local setup_sources = {}
    for source_type, srcs in pairs(sources) do
      for source_name, opts in pairs(srcs) do
        table.insert(setup_sources, null_ls.builtins[source_type][source_name].with(opts))
      end
    end
    require("null-ls").setup({
      sources = setup_sources,
    })
  end,
  lazy = false,
}
