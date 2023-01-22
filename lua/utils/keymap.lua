local function map(mode, keys, func, desc, buffer)
  if desc then
    desc = desc
  end
  vim.keymap.set(mode, keys, func, {
    buffer = buffer,
    noremap = true,
    silent = true,
  })
end

local function imap(keys, func, desc, buffer)
  map("i", keys, func, desc, buffer)
end

local function nmap(keys, func, desc, buffer)
  map("n", keys, func, desc, buffer)
end

local function tmap(keys, func, desc, buffer)
  map("t", keys, func, desc, buffer)
end

local function vmap(keys, func, desc, buffer)
  map("v", keys, func, desc, buffer)
end

return {
  map = map,
  imap = imap,
  nmap = nmap,
  tmap = tmap,
  vmap = vmap,
}
