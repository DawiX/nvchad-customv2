local linters_by_ft = {
  dockerfile = { "hadolint" },
  markdown = { "markdownlint" },
  bash = { "shellcheck" },
  ansible = { "ansible_lint" },
  yaml = { "yamllint" },
  -- python = { "pylint" },
}

return linters_by_ft
