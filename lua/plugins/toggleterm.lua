local nmap = require("utils.keymap").nmap
local tmap = require("utils.keymap").tmap

return {
  "akinsho/toggleterm.nvim",
  lazy = false,
  config = function()
    require("toggleterm").setup({
      open_mapping = [[<C-\>]],
      size = 20,
      persist_size = true,
      on_open = function(term)
        if string.sub(term.name, 1, #"lazygit") ~= "lazygit" then
          tmap("<esc>", [[<C-\><C-n>]], "", term.bufnr)
          tmap("jk", [[<C-\><C-n>]], "", term.bufnr)
          tmap("<C-h>", [[<Cmd>wincmd h<CR>]], "", term.bufnr)
          tmap("<C-j>", [[<Cmd>wincmd j<CR>]], "", term.bufnr)
          tmap("<C-k>", [[<Cmd>wincmd k<CR>]], "", term.bufnr)
          tmap("<C-l>", [[<Cmd>wincmd l<CR>]], "", term.bufnr)
        end
      end,
    })

    -- lazygit
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
      cmd = "lazygit",
      direction = "float",
      hidden = true,
      terminal_mappings = false,
      count = 11,
    })
    function _G._lazygit_toggle()
      lazygit:toggle()
    end
    nmap("<leader>g", "<cmd>lua _lazygit_toggle()<CR>")
  end,
}
