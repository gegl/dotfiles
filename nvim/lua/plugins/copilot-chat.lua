return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
    },
    config = function()
      require("CopilotChat").setup({
        -- Configuration options for copilot chat
      })

      local wk = require("which-key")
      wk.register({
        c = {
          name = "chat",
          c = { "<cmd>CopilotChatToggle<CR>", "toggle" },
          e = { "<cmd>CopilotChatExplain<CR>", "[e]xplain", mode = { "n", "v" } },
          o = { "<cmd>CopilotChatOptimize<CR>", "[o]ptimize", mode = { "n", "v" } },
          v = { "<cmd>CopilotChatReview<CR>", "re[v]iew", mode = { "n", "v" } },
          r = { "<cmd>CopilotChatReset<CR>", "[r]eset", mode = { "n", "v" } },
        },
      }, { prefix = "<leader>" })
    end,
    -- See Commands section for default commands if you want to lazy load on them
  },
}
