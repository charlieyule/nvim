return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    config = function()
      require("tokyonight").setup({
        transparent = true,
        styles = {
          sidebars = "transparent",
        },
      })

      vim.cmd("colorscheme tokyonight")
    end,
  },
}
