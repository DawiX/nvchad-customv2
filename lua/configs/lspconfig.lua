-- load defaults i.e lua_lsp

local configs = require "nvchad.configs.lspconfig"

local servers = {
  omnisharp = {},
  html = {},
  terraformls = {},
  tflint = {},
  gopls = {},
  golangci_lint_ls = {},
  bashls = {},
  ansiblels = {},
  dockerls = {},
  marksman = {},
  sqlls = {},
  lemminx = {},
  pyright = {
    settings = {
      python = {
        analysis = {
          autoSearchPaths = true,
          diagnosticMode = "openFilesOnly", -- resources optimization
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
  helm_ls = {
    settings = {
      ["helm-ls"] = {
        yamlls = {
          enabled = false, -- need this to disable embedded yamlls within helm_ls for power consumption
        },
      },
    },
  },
  yamlls = {
    single_file_support = true, -- resource optimization
    settings = {
      redhat = {
        telemetry = {
          enabled = false,
        },
      },
      yaml = {
        keyOrdering = false,
        customTags = {
          "!reference sequence",
          "!And",
          "!And sequence",
          "!If",
          "!If sequence",
          "!Not",
          "!Not sequence",
          "!Equals",
          "!Equals sequence",
          "!Or",
          "!Or sequence",
          "!FindInMap",
          "!FindInMap sequence",
          "!Base64",
          "!Join",
          "!Join sequence",
          "!Cidr",
          "!Ref",
          "!Sub",
          "!Sub sequence",
          "!GetAtt",
          "!GetAZs",
          "!ImportValue",
          "!ImportValue sequence",
          "!Select",
          "!Select sequence",
          "!Split",
          "!Split sequence",
        },
      },
    },
  },
}

for name, opts in pairs(servers) do
  opts.on_init = configs.on_init
  opts.on_attach = configs.on_attach
  opts.capabilities = configs.capabilities

  require("lspconfig")[name].setup(opts)
end

-- Stop LSP clients when no buffers need them because LSP is hungry as fck
-- when multiplexing
vim.api.nvim_create_autocmd("BufDelete", {
  callback = function(args)
    local bufnr = args.buf
    local clients = vim.lsp.get_clients { bufnr = bufnr }
    for _, client in ipairs(clients) do
      local bufs = vim.lsp.get_buffers_by_client_id(client.id)
      if #bufs == 1 and bufs[1] == bufnr then
        client.stop()
      end
    end
  end,
})
