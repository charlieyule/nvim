local nmap = require("utils.nmap")
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = false,
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      nmap("<leader>ff", builtin.find_files, "[F]ind [F]iles")
      nmap("<leader>fg", builtin.live_grep, "[L]ive [G]rep")
      nmap("<leader>fb", builtin.buffers, "[F]ind [B]uffer")
      nmap("<leader>fh", builtin.help_tags, "[F]ind [H]elp")

      telescope.setup({
        defaults = {
          file_ignore_patterns = {
            -- Go
            "vendor",
          },
        },
      })
    end,
  },
}
