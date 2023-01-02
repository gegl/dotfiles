local M = {}

function M.setup()
  vim.api.nvim_exec(
    [[
        " Test config
        let test#strategy = "neovim"
        let test#neovim#term_position = "belowright"
        let g:test#preserve_screen = 1
    ]],
    false
  )
end

return M
