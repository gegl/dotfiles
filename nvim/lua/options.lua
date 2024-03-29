local api = vim.api
local g = vim.g
local opt = vim.opt

-- Remap leader and local leader to comma
api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
g.mapleader = ","
g.maplocalleader = ","

opt.termguicolors = true -- Enable colors in terminal
opt.hlsearch = true --Set highlight on search
opt.number = true --Make line numbers default
opt.mouse = "a" --Enable mouse mode
opt.breakindent = true --Enable break indent
opt.undofile = true --Save undo history
opt.ignorecase = true --Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.updatetime = 250 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.clipboard = "unnamedplus" -- Access system clipboard
opt.timeoutlen = 300 -- Time in milliseconds to wait for a mapped sequence to complete.
opt.showmode = false -- Do not need to show the mode. We use the statusline instead.
opt.swapfile = false
opt.wrap = false
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Better search
opt.path:remove "/usr/include"
opt.path:append "**"

-- DB UI
g.db_ui_save_location = '~/.config/db_ui'
g.db_ui_execute_on_save = false

-- Use system clipboard to make copy/paste between Neovim and OS work better
-- Requires sudo apt install wl-clipboard on Ubuntu 22.04 (w/Wayland)
opt.clipboard = "unnamedplus"

