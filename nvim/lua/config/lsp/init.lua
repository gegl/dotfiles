local M = {}

function M.setup()
  require("mason").setup()
  require("mason-lspconfig").setup {
    automatic_installation = true,
  }

  require("lspconfig").sumneko_lua.setup {}
  require("lspconfig").solargraph.setup {}
end

return M
