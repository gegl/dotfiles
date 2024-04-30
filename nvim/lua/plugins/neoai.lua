return {
    "Bryley/neoai.nvim",
    enabled = false,
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    cmd = {
        "NeoAI",
        "NeoAIOpen",
        "NeoAIClose",
        "NeoAIToggle",
        "NeoAIContext",
        "NeoAIContextOpen",
        "NeoAIContextClose",
        "NeoAIInject",
        "NeoAIInjectCode",
        "NeoAIInjectContext",
        "NeoAIInjectContextCode",
    },
    keys = function()
      local wk = require("which-key")
      wk.register({
        a = {
          name = "neoai",
          c = { "<cmd>NeoAIToggle<CR>", "NeoAI [c]hat" },
        },
      }, { prefix = "<leader>" })
    end,
    config = function()
        require("neoai").setup({
          models = {
            {
              name = "openai",
              model = "gpt-4-turbo",
              params = nil,
            },
          },
        })
    end,
}
