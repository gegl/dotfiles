local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    profile = {
      enable = true,
      threshold = 1, -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },

    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Colorscheme
    use {
      "sainnhe/everforest",
      config = function()
        vim.cmd "colorscheme everforest"
      end,
    }

    -- Startup screen
    use {
      "goolord/alpha-nvim",
      config = function()
        require("config.alpha").setup()
      end,
    }

    -- Always save changes
    use "pocco81/auto-save.nvim"

    -- Better icons
    use {
      "nvim-tree/nvim-web-devicons",
      module = "nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup { default = true }
      end,
    }

    -- Better Comment
    use {
      "numToStr/Comment.nvim",
      keys = { "gc", "gcc", "gbc" },
      config = function()
        require("Comment").setup {}
      end,
    }

    -- Better surround
    use { "tpope/vim-surround", event = "InsertEnter" }

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      opt = true,
      config = function()
        require("config.telescope").setup()
      end,
      cmd = { "Telescope" },
      module = "telescope",
      keys = { "<leader>f", "<leader>p" },
      wants = {
        "plenary.nvim",
        "popup.nvim",
        "telescope-fzf-native.nvim",
        "telescope-project.nvim",
        "telescope-repo.nvim",
        "telescope-file-browser.nvim",
        "project.nvim",
      },
      requires = {
        "nvim-lua/popup.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        "nvim-telescope/telescope-project.nvim",
        "cljoly/telescope-repo.nvim",
        "nvim-telescope/telescope-file-browser.nvim",
        {
          "ahmedkhalf/project.nvim",
          config = function()
            require("project_nvim").setup {}
          end,
        },
      },
    }

    -- Status line
    use {
      'nvim-lualine/lualine.nvim',
      event = "VimEnter",
      config = function()
        require('config.lualine').setup()
      end,
      requires = { 'nvim-tree/nvim-web-devicons' },
    }

    use {
      "folke/which-key.nvim",
      config = function()
        require("config.whichkey").setup()
      end
    }

    use {
      "vim-test/vim-test",
      opt = true,
      cmd = {
        "TestNearest",
        "TestFile",
        "TestSuite",
        "TestLast",
        "TestVisit",
      },
      config = function()
        require("config.test").setup()
      end,
    }

    -- ChatGPT
    use({
      "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup({
          -- optional configuration
        })
      end,
      cmd = { "ChatGPT" },
      wants = {
        "nui.nvim",
        "plenary.nvim",
        "telescope.nvim",
      },
      requires = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
      }
    })

    -- Database
    use { 'tpope/vim-dadbod' }
    use { 'kristijanhusak/vim-dadbod-ui' }

    -- LSP
    use {
      "neovim/nvim-lspconfig",
      opt = true,
      event = "BufReadPre",
      wants = {
        "mason.nvim",
        "mason-lspconfig.nvim",
      },
      config = function()
        require("config.lsp").setup()
      end,
      requires = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
      },
    }

    -- Required for Telescope live_grep. Requires ripgrep to be installed.
    use { "BurntSushi/ripgrep" }

    use({
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("config.treesitter").setup()
      end,
      requires = {"nvim-treesitter/playground"}
    })

    -- Completion
    use {
      "ms-jpq/coq_nvim",
      branch = "coq",
      event = "InsertEnter",
      opt = true,
      run = ":COQdeps",
      config = function()
        require("config.coq").setup()
      end,
      requires = {
        { "ms-jpq/coq.artifacts", branch = "artifacts" },
        { "ms-jpq/coq.thirdparty", branch = "3p", module = "coq_3p" },
      },
      disable = false,
    }

    -- Generate UUID
    use { "kburdett/vim-nuuid" }

    -- Git support
    use { 'tpope/vim-fugitive' }
    use { 'tpope/vim-rhubarb' }

    -- File browser in Telescope
    --
    -- Uses fd-find if installed
    use { "nvim-telescope/telescope-file-browser.nvim" }

    -- Jump to Git respositories on file system
    use 'cljoly/telescope-repo.nvim'

    -- Beautify Markdown previews
    use { "ellisonleao/glow.nvim" }

    -- Preview binary files
    use { 'nvim-telescope/telescope-media-files.nvim' }

    -- Additional text objects based on treesitter
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }

    -- Additional text objects based on treesitter
    use { 'RRethy/nvim-treesitter-textsubjects' }

    -- Autoclose/rename HTML tags
    use { 'windwp/nvim-ts-autotag' }

    -- Autoclose based on treesitter
    use { 'RRethy/nvim-treesitter-endwise' }

    use { 'github/copilot.vim' }

    -- Markdown preview in browser
    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    -- Required for neotree to work directly after startup i.e. when these are not loaded by other plugins
    use { 'MunifTanjim/nui.nvim' }
    use { "nvim-lua/plenary.nvim" }

    -- Replace nvim-tree filebrowser
    --
    -- Note: also capable of displaying other tree structures, see doc
    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v2.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
      }
    }

    -- Flutter
    use {
      "akinsho/flutter-tools.nvim",
      requires = { "nvim-lua/plenary.nvim" },
      config = function()
        require("config.flutter").setup()
      end,
    }

    -- Debug adapter protocol, required by Flutter plugin
    use 'mfussenegger/nvim-dap'

    -- Bootstrap Neovim
    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  -- Init and start packer
  packer_init()
  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
