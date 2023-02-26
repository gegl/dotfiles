local M = {}

function M.setup()
  require("mason").setup()
  require("mason-lspconfig").setup {
    automatic_installation = true,
  }

  require("lspconfig").lua_ls.setup {}

  require("lspconfig").solargraph.setup {}

  -- TODO: missing config ref. https://github.com/hashicorp/terraform-ls/blob/main/docs/USAGE.md#neovim-v080
  require("lspconfig").terraformls.setup {}
end

return M
