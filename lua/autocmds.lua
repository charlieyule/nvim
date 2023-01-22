-- Show line diagnostics automatically in hover window
vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, source=true})]])
-- Auto-format on write
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
