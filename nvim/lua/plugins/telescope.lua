local setup = function()
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  local builtin = require("telescope.builtin")

  local get_total_buffers = function()
    local bufnrs = {}
    local i = 1
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
      if vim.fn.buflisted(bufnr) == 1 then
        bufnrs[i] = bufnr
        i = i + 1
      end
    end
    return #bufnrs
  end

  local in_git_repo = function()
    vim.fn.system("git rev-parse --is-inside-work-tree")
    if vim.v.shell_error == 0 then
      return true
    else
      return false
    end
  end

  local default_picker = function()
    local picker = builtin.oldfiles
    if get_total_buffers() > 1 then
      picker = builtin.buffers
    elseif in_git_repo() then
      picker = builtin.git_files
    end
    return picker()
  end

  local picker_map = {
    ["Buffers"] = builtin.buffers,
    ["Git Files"] = builtin.git_files,
    ["Oldfiles"] = builtin.oldfiles,
    ["Find Files"] = builtin.find_files,
    ["Telescope Builtin"] = builtin.builtin,
  }

  local get_pickers_to_cycle = function()
    local ordered_pickers = {
      "Buffers",
      "Git Files",
      "Oldfiles",
      "Find Files",
      "Telescope Builtin",
    }
    local pickers_to_cycle = {}
    local i = 1
    for _, title in ipairs(ordered_pickers) do
      if title == "Buffers" and get_total_buffers() < 2 then
        goto continue
      elseif title == "Git Files" and not in_git_repo() then
        goto continue
      end
      pickers_to_cycle[i] = title
      i = i + 1
      ::continue::
    end
    return pickers_to_cycle
  end

  local next_picker = function(prompt_bufnr)
    local pickers_to_cycle = get_pickers_to_cycle()
    local state = require("telescope.actions.state")
    local current_picker = state.get_current_picker(prompt_bufnr)

    local next_index = 1
    for i, title in ipairs(pickers_to_cycle) do
      if title == current_picker.prompt_title then
        next_index = i + 1
        if next_index > #pickers_to_cycle then
          next_index = 1
        end
        break
      end
    end
    local next_title = pickers_to_cycle[next_index]
    local new_picker = picker_map[next_title]
    return new_picker({ ["default_text"] = state.get_current_line() })
  end

  local prev_picker = function(prompt_bufnr)
    local pickers_to_cycle = get_pickers_to_cycle()
    local state = require("telescope.actions.state")
    local current_picker = state.get_current_picker(prompt_bufnr)

    local prev_index = 1
    for i, title in ipairs(pickers_to_cycle) do
      if title == current_picker.prompt_title then
        prev_index = i - 1
        if prev_index == 0 then
          prev_index = #pickers_to_cycle
        end
        break
      end
    end
    local prev_title = pickers_to_cycle[prev_index]
    local new_picker = picker_map[prev_title]
    return new_picker({ ["default_text"] = state.get_current_line() })
  end

  telescope.setup({
    defaults = {
      color_devicons = false,
      layout_config = {
        width = 0.7,
        horizontal = {
          preview_width = 0.6,
        },
      },
      mappings = {
        i = {
          ["<C-u>"] = false,
          ["<C-d>"] = false,
          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-f>"] = next_picker,
          ["<C-b>"] = prev_picker,
          ["<C-o>"] = actions.select_default,
        },
      },
    },
    pickers = {
      buffers = {
        ignore_current_buffer = true,
        sort_lastused = true,
      },
    },
  })
  telescope.load_extension("fzf")

  local wk = require("which-key")
  wk.register({
    h = { "<cmd>Telescope help_tags<cr>", "[H]elp" },
    f = {
      name = "file",
      f = { "<cmd>Telescope find_files<cr>", "[F]ind File" },
      g = { "<cmd>Telescope live_grep<cr>", "[G]rep" },
      w = { "<cmd>Telescope grep_string<cr>", "Grep Current [W]ord" },
    },
    g = {
      name = "git",
      s = { "<cmd>Telescope git_status<cr>", "Git [S]tatus" },
      l = { "<cmd>Telescope git_commits<cr>", "Git [L]og" },
      b = { "<cmd>Telescope git_branches<cr>", "Git [B]ranches" },
    },
    u = {
      name = "utils",
      c = { "<cmd>Telescope colorscheme<cr>", "Show [C]olorschemes" },
    },
  }, { prefix = "<leader>" })
end

return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = setup,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = false,
    cond = function()
      return vim.fn.executable("make") == 1
    end,
  },
  { "BurntSushi/ripgrep" },
  { "ellisonleao/glow.nvim" },
}
