return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        ensure_installed = {
          "go",
          "gomod",
          "lua",
          "vim",
          "help",
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true,
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn", -- set to `false` to disable one of the mappings
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        indent = { enable = true },
      })
    end,
  },
}
