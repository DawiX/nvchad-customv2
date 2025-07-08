-- load defaults i.e lua_lsp

local configs = require "nvchad.configs.lspconfig"

local servers = {
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
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = true,
        },
      },
    },
  },
  helm_ls = {
    settings = {
      ["helm-ls"] = {
        yamlls = {
          path = "yaml-language-server",
        },
      },
    },
  },
  yamlls = {
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
