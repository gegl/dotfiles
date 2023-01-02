local M = {}

function M.setup()
  vim.api.nvim_exec(
    [[
        " Test config
        let test#strategy = "neovim"
        let test#neovim#term_position = "belowright"
        let g:test#preserve_screen = 1
        let test#ruby#rspec#executable = "docker-compose run --no-deps --rm -v ${PWD}:/app -w /app app bundle exec rspec"
    ]],
    false
  )
end

return M
