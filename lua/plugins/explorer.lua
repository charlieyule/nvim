return {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons", -- optional, for file icons
  },
  lazy = false,
  config = function()
    local tree_cb = require("nvim-tree.config").nvim_tree_callback

    require("nvim-tree").setup({
      disable_netrw = false,
      view = {
        hide_root_folder = true,
        mappings = {
          list = {
            { key = { "l", "<CR>", "o" }, cb = tree_cb("edit") },
            { key = "h", cb = tree_cb("close_node") },
            { key = "v", cb = tree_cb("vsplit") },
          },
        },
        number = true,
        relativenumber = true,
      },
      diagnostics = {
        enable = true,
      },
    })
  end,
}
