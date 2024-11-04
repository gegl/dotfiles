return {
  "vim-test/vim-test",
  lazy = false,
  config = function()
    vim.g["test#strategy"] = "neovim"
    vim.g["test#neovim#term_position"] = "belowright"
    vim.g["test#neovim#preserve_screen"] = 1
    vim.g["test#python#runner"] = "pyunit" -- pytest
    -- Run all Ruby/rspec tests using docker compose assuming existence of app service with Ruby image
    vim.g["test#ruby#rspec#executable"] = "docker compose run --no-deps --rm -v ${PWD}:/app -w /app app bundle exec rspec"
    -- Run all JavaScript/mocha tests using docker compose assuming existence of app service with Node image
    vim.g["test#javascript#mocha#executable"] = "docker compose run --no-deps --rm -v ${PWD}:/app -w /app app node node_modules/.bin/mocha"

    local wk = require("which-key")
    wk.register({
      t = {
        name = "test",
        c = { "<cmd>TestClass<cr>", "[C]lass" },
        f = { "<cmd>TestFile<cr>", "[F]ile" },
        l = { "<cmd>TestLast<cr>", "[L]ast" },
        n = { "<cmd>TestNearest<cr>", "[N]earest" },
        s = { "<cmd>TestSuite<cr>", "[S]uite" },
        v = { "<cmd>TestVisit<cr>", "[V]isit" },
      },
    }, { prefix = "<leader>" })
  end,
}
