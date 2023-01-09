local M = {}

function M.setup()
  local wk = require("which-key")

  wk.register({
    ["<leader>"] = {
      f = {
        name = "+file",
        b = { "<cmd>Telescope file_browser<cr>", "Browse" },
        f = { "<cmd>Telescope find_files<cr>", "Find file" },
        g = { "<cmd>Telescope live_grep<cr>", "Grep" },
      },
    }
  })

  wk.register({
    ["<C-p>"] = { "<cmd>Telescope find_files<cr>", "Find file" } 
  })
end

return M
