return {
  "akinsho/bufferline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "moll/vim-bbye",
  },
  lazy = false,
  config = function()
    require("bufferline").setup({
      options = {
        offsets = {
          { filetype = "NvimTree", text = "File Explorer", padding = 1 },
        },
      },
    })
  end,
}
