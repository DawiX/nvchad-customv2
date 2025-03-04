require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

-- Disable default mappings
nomap("n", "<C-n>") -- disabling NvimTreeToggle

-- VISUAL
map("v", "vv", "<Esc>", { desc = "vv to leave visual mode" })
map("v", "J", ":<C-u>silent! '<,'>move'>+1<CR>gv=gv", { desc = "Move highlight down" })
map("v", "K", ":<C-u>silent! '<,'>move-2<CR>gv=gv", { desc = "MOve highlight up" })
map("v", "<", "<gv", { desc = "unindent line" })
map("v", ">", ">gv", { desc = "indent line" })
map("v", "<leader>S", "<Plug>VSurround", { desc = "Surround visual selection with char" })

-- NORMAL
map("n", "<leader>Ti", ":!terraform init --upgrade<CR>", { desc = "Terraform init upgrade" })
map("n", "<leader>Tf", ":!terragrunt hclfmt<CR>", { desc = "Terragrunt fmt" })
map("n", "<leader>rr", "<Plug>RestNvim<cr>", { desc = "Run request under cursor" })
map("n", "<leader>rp", "<Plug>RestNvimPreview<cr>", { desc = "Preview request cURL command" })
map("n", "<leader>rh", "<cmd>RustHoverActions<cr>", { desc = "Rust Hoover actions" })
map("n", "<leader>aa", ":set ft=yaml.ansible<CR>", { desc = "Attach ansiblels manually for open file" })
map("n", "<leader>cw", ":cd %:p:h<CR>", { desc = "Change dir to dir of currently opened file" })
map("n", "<leader>mr", ":CellularAutomaton make_it_rain<CR>", { desc = "Make it rain" })
map("n", "<leader>fl", ":lua require('lint').try-lint()<cr>", { desc = "Force linting" })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")
