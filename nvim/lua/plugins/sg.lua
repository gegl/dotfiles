return {
  {
    "sourcegraph/sg.nvim",
    enabled = true,
    dependencies = { 
      "nvim-lua/plenary.nvim", 
      "nvim-telescope/telescope.nvim" 
    },
    config = function()
      require("sg").setup()
    end
  },
}
