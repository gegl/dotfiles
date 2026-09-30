return {
  {
    "nvim-treesitter/nvim-treesitter",
    -- Off: the master branch does not support Neovim 0.12+ and crashes on
    -- injected code (e.g. a Python heredoc in a shell script). Regex syntax
    -- highlighting is used instead.
    enabled = false,
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
    'RRethy/nvim-treesitter-endwise',
    enabled = false,
  },
  {
    'RRethy/nvim-treesitter-textsubjects',
    enabled = false,
  },
  {
    'windwp/nvim-ts-autotag',
    enabled = false,
  },
}

