return function(keys, func, desc, buffer)
  if desc then
    desc = desc
  end

  vim.keymap.set("n", keys, func, {
    buffer = buffer,
    noremap = true,
    silent = true,
  })
end
