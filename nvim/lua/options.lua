vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', {noremap = true, silent = true})

local opt = vim.opt
opt.termguicolors = true -- True color support
opt.number = true
opt.hlsearch = true --Set highlight on search
opt.mouse = "a" --Enable mouse mode
opt.undofile = true --Save undo history
opt.ignorecase = true --Case insensitive searching unless /C or capital in search
opt.smartcase = true -- Smart case
opt.updatetime = 250 --Decrease update time
opt.signcolumn = "yes" -- Always show sign column
opt.timeoutlen = 300 -- Time in milliseconds to wait for a mapped sequence to complete.
opt.showmode = false -- Do not need to show the mode. We use the statusline instead.
opt.swapfile = false
opt.wrap = false
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.cursorline = true -- Enable highlighting of the current line
opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 3 -- global statusline
opt.list = true -- Show some invisible characters (tabs...
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.sidescrolloff = 8 -- Columns of context
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitkeep = "screen"
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.undolevels = 10000
opt.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width
if vim.fn.has("nvim-0.10") == 1 then
  opt.smoothscroll = true
end
-- Use system clipboard to make copy/paste between Neovim and OS work better
-- Requires sudo apt install wl-clipboard on Ubuntu 22.04 (w/Wayland)
opt.clipboard = "unnamedplus"

-- Highlight on yank
vim.cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
