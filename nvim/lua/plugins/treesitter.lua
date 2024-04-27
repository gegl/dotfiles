return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = { "ruby", "lua", "javascript", "html", "css", "sql", "git_rebase", "bash", "dart" },
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },
        endwise = { enable = true },
        textsubjects = {
          enable = true,
          keymaps = {
              ['.'] = 'textsubjects-smart',
              [';'] = 'textsubjects-container-outer',
              ['i;'] = { 'textsubjects-container-inner', desc = "Select inside containers (classes, functions, etc.)" },
          },
          autotag = {
            enable = true,
            enable_rename = true,
            enable_close = true,
            enable_close_on_slash = true,
          }
        },
      })
    end
  },
  {
    'RRethy/nvim-treesitter-endwise'
  },
  {
    'RRethy/nvim-treesitter-textsubjects'
  },
  {
    'windwp/nvim-ts-autotag'
  },
}

