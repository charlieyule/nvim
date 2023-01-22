local tmap = require("utils.keymap").tmap

return {
  "akinsho/toggleterm.nvim",
  lazy = false,
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-\>]],
      size = 20,
      persist_size = true,
    })
    function _G.set_terminal_keymaps()
      tmap("<esc>", [[<C-\><C-n>]])
      tmap("jk", [[<C-\><C-n>]])
      tmap("<C-h>", [[<Cmd>wincmd h<CR>]])
      tmap("<C-j>", [[<Cmd>wincmd j<CR>]])
      tmap("<C-k>", [[<Cmd>wincmd k<CR>]])
      tmap("<C-l>", [[<Cmd>wincmd l<CR>]])
    end
    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}
