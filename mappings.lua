---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
  v = {
    [">"] = { ">gv", "indent"},
  },
  -- Add terminal mode mappings here
  t = {
    ["<Esc>"] = { [[<C-\><C-n>]], "exit insert mode", opts = { nowait = true } },
  },
}

-- more keybinds!

return M
