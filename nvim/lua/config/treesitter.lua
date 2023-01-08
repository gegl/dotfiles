local M = {}

function M.setup()
  require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    --
    -- If used embedded in other language, they must be installed upfront. This
    -- applies to html/css for Lit components and sql used inline in Ruby.
    --
    -- Note: may require npm install tree-sitter-cli (e.g. sql)
    ensure_installed = { "ruby", "lua", "javascript", "html", "css", "sql" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    ignore_install = {},

    ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
    -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

    highlight = {
      -- `false` will disable the whole extension
      enable = true,

      -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
      -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
      -- Using this option may slow down your editor, and you may see some duplicate highlights.
      -- Instead of true it can also be a list of languages
      additional_vim_regex_highlighting = false,
    },
  }
end

return M
