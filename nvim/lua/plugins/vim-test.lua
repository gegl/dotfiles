return {
  "vim-test/vim-test",
  lazy = false,
  keys = {
    { "<leader>tc", "<cmd>TestClass<cr>", desc = "Class" },
    { "<leader>tf", "<cmd>TestFile<cr>", desc = "File" },
    { "<leader>tl", "<cmd>TestLast<cr>", desc = "Last" },
    { "<leader>tn", "<cmd>TestNearest<cr>", desc = "Nearest" },
    { "<leader>ts", "<cmd>TestSuite<cr>", desc = "Suite" },
    { "<leader>tv", "<cmd>TestVisit<cr>", desc = "Visit" },
  },
  config = function()
    vim.g["test#strategy"] = "neovim"
    vim.g["test#neovim#term_position"] = "belowright"
    vim.g["test#neovim#preserve_screen"] = 1
    vim.g["test#python#runner"] = "pyunit" -- pytest
    -- Run all Ruby/rspec tests using docker-compose assuming existence of app service with Ruby image
    vim.g["test#ruby#rspec#executable"] = "docker-compose run --no-deps --rm -v ${PWD}:/app -w /app app bundle exec rspec"
    -- Run all JavaScript/mocha tests using docker-cmpose assuming existence of app service with Node image
    vim.g["test#javascript#mocha#executable"] = "docker-compose run --no-deps --rm -v ${PWD}:/app -w /app app node node_modules/.bin/mocha"
  end,
}
