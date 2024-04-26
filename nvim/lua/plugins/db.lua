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
        name = "db",
        u = { "<cmd>DBUIToggle<cr>", "Toggle DB [U]I" },
        e = { "<Plug>(DBUI_ExecuteQuery)", "[E]xecute SQL" },
        s = { "<Plug>(DBUI_SaveQuery)", "[S]ave SQL" },
        p = { "<Plug>(DBUI_EditBindParameters)", "Edit SQL [P]arameters" },
      },
    }, { prefix = "<leader>" })
  end,
}
