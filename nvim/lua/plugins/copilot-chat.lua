return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
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
          r = { "<cmd>CopilotChatReset<CR>", "[r]eset" },
        },
      }, { prefix = "<leader>", mode = "n" })

      wk.register({
        c = {
          name = "chat",
          e = { ":'<,'>CopilotChatExplain<CR>", "[e]xplain" },
          o = { "<cmd>CopilotChatOptimize<CR>", "[o]ptimize" },
          v = { "<cmd>CopilotChatReview<CR>", "re[v]iew" },
          d = { "<cmd>CopilotChatDocs<CR>", "[d]oc" },
          t = { "<cmd>CopilotChatTests<CR>", "[t]est" },
        },
      }, { prefix = "<leader>", model = "v" })
    end,
    -- See Commands section for default commands if you want to lazy load on them
  },
}
