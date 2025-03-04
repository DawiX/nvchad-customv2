return {
  {
    "mfussenegger/nvim-lint",
    enabled = true,
    event = { "LspAttach", "BufNewFile", "BufWritePre", "TextChanged" },
    config = function()
      require("lint").linters_by_ft = require "configs.nvim-lint"

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "LspAttach", "BufNewFile", "BufWritePre", "TextChanged" }, {
        group = lint_augroup,
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
}
