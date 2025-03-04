return {
  {
    "stevearc/conform.nvim",
    event = { "LspAttach", "BufNewFile", "BufWritePre" },
    opts = require "configs.conform",
  },
}
