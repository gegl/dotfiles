return {
  "kburdett/vim-nuuid",
  init = function()
    local wk = require("which-key")
    wk.register({
      u = {
        name = "utils",
        u = { "<Plug>Nuuid", "Generate [U]UID" },
      },
    }, { prefix = "<leader>" })
  end,
}
