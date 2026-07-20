return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
      },
      renderer = {
        highlight_git = "name",
        icons = {
          show = {
            git = true,
          },
        },
      },
      filesystem_watchers = {
        enable = true,
      },
    },
    init = function()
      local function refresh_tree()
        local ok, api = pcall(require, "nvim-tree.api")
        if ok and api.tree.is_visible() then
          api.tree.reload()
        end
      end

      --aaaaa

      -- Refresh on focus gain (from external app)
      vim.api.nvim_create_autocmd("FocusGained", { callback = refresh_tree })

      -- Refresh when entering any normal file buffer
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          local buftype = vim.bo.buftype
          local filetype = vim.bo.filetype
          -- Only refresh when entering a normal file (not terminal, nvimtree, etc)
          if buftype == "" and filetype ~= "NvimTree" then
            vim.defer_fn(refresh_tree, 100)
          end
        end,
      })
    end,
  },
}
