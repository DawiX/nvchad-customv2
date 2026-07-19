return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
      },
      filesystem_watchers = {
        enable = true,
        debounce_delay = 50,
        ignore_dirs = { "node_modules", ".git" },
      },
      actions = {
        open_file = {
          resize_window = true,
        },
      },
      renderer = {
        highlight_git = "name",
        icons = {
          show = {
            git = true,
          },
          glyphs = {
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
      },
    },
    init = function()
      -- Auto-refresh nvim-tree on focus and after git commands
      vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
        callback = function()
          if vim.fn.exists(":NvimTreeRefresh") == 2 then
            vim.cmd("NvimTreeRefresh")
          end
        end,
      })
    end,
  },
}
