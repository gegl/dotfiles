return {
  'kristijanhusak/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod' },
    { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'plsql' } },
  },
  init = function()
    vim.g.db_ui_save_location = '~/.config/db_ui'
    vim.g.db_ui_execute_on_save = false
    vim.g.db_ui_use_nerd_fonts = 1

    local wk = require("which-key")
    wk.register({
      d = {
        name = "DB",
        u = { "<cmd>DBUIToggle<cr>", "Toggle DB UI" },
        e = { "<Plug>(DBUI_ExecuteQuery)", "Execute SQL" },
        s = { "<Plug>(DBUI_SaveQuery)", "Save SQL" },
        b = { "<Plug>(DBUI_EditBindParameters)", "Edit SQL parameters" },
      },
    }, { prefix = "<leader>" })
  end,
}
