-- load defaults i.e lua_lsp

-- local configs = require "nvchad.configs.lspconfig"
--
-- local servers = {
--   html = {},
--   awk_ls = {},
--   bashls = {},
--
--   pyright = {
--     settings = {
--       python = {
--         analysis = {
--           autoSearchPaths = true,
--           typeCheckingMode = "basic",
--         },
--       },
--     },
--   },
-- }
--
-- for name, opts in pairs(servers) do
--   opts.on_init = configs.on_init
--   opts.on_attach = configs.on_attach
--   opts.capabilities = configs.capabilities
--
--   require("lspconfig")[name].setup(opts)
-- end

require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = {
  "html",
  "terraformls",
  "tflint",
  "gopls",
  "bashls",
  "ansiblels",
  "dockerls",
  "marksman",
  "sqlls",
  "lemminx",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.yamlls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  -- filetypes = { "yaml", "yaml.dockercompose" },
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
}

lspconfig.pyright.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  -- cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
    },
  },
}

-- local configs = require "nvchad.configs.lspconfig"
--
-- local servers = {
--   html = {},
--   awk_ls = {},
--   bashls = {},
--
--   pyright = {
--     settings = {
--       python = {
--         analysis = {
--           autoSearchPaths = true,
--           typeCheckingMode = "basic",
--         },
--       },
--     },
--   },
-- }
--
-- for name, opts in pairs(servers) do
--   opts.on_init = configs.on_init
--   opts.on_attach = configs.on_attach
--   opts.capabilities = configs.capabilities
--
--   require("lspconfig")[name].setup(opts)
-- end
