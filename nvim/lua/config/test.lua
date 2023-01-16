local M = {}

function M.setup()
  vim.api.nvim_exec(
    [[
        " Test config
        let test#strategy = "neovim"
        let test#neovim#term_position = "belowright"
        let g:test#preserve_screen = 1

        " Run all Ruby/rspec tests using docker-compose assuming existence of app service with Ruby image
        let test#ruby#rspec#executable = "docker-compose run --no-deps --rm -v ${PWD}:/app -w /app app bundle exec rspec"

        " Run all JavaScript/mocha tests using docker-cmpose assuming existence of app service with Node image
        let test#javascript#mocha#executable = "docker-compose run --no-deps --rm -v ${PWD}:/app -w /app app node node_modules/.bin/mocha"
    ]],
    false
  )
end

return M
