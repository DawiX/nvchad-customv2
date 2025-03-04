local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt", lsp_format = "fallback" },
    python = { "autopep8", "docformatter" },
    terraform = { "terraform_fmt" },
    go = { "goimports", "gofmt" },
    xml = { "xmllint" },
    bash = { "shellcheck", "shellharden", "shfmt" },
    markdown = { "markdownlint" },
    hcl = { "packer_fmt", "terragrunt_hclfmt" },
    json = { "jq" },
    docker = { "hadolint" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").formatters.shfmt = {
  prepend_args = { "-i", "4" },
}

return options
