-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "gruvbox",
  theme_toggle = { "gruvbox", "gruvbox_light" },
}

M.nvdash = { load_on_startup = true }
M.ui = {
  cmp = {
    style = "default",
    lspkind_text = true,
  },
  statusline = {
    theme = "default",
  },
}

M.term = {
  sizes = { sp = 0.3, vsp = 0.5 },
  float = {
    relative = "editor",
    row = 0.25,
    col = 0.15,
    width = 0.65,
    height = 0.5,
  },
}

M.colorify = {
  enabled = true,
}

M.mason = {
  pkgs = {
    "hadolint",
    "ansible-lint",
    "yamllint",
  },
}

return M
