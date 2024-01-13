-- local autocmd = vim.api.nvim_create_autocmd
local options = {
  smartindent     = true,
  autoindent      = true,
  scrolloff       = 12,
  relativenumber  = true
}
for k, v in pairs(options) do vim.opt[k] = v end
-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
