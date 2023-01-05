local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Telescope
keymap("n", "<Leader>ff", ":Telescope find_files<CR>", default_opts)
keymap("n", "<Leader>fi", ":Telescope live_grep<CR>", default_opts)
keymap("n", "<Leader>fg", ":Telescope git_files<CR>", default_opts)
keymap("n", "<Leader>fh", ":Telescope help_tags<CR>", default_opts)
keymap("n", "<Leader>fb", ":Telescope file_browser<CR>", default_opts)
keymap("n", "<Leader>fr", ":Telescope repo list<CR>", default_opts)
keymap("n", "<C-p>", ":Telescope find_files<CR>", default_opts)

-- DB client
keymap("n", "<Leader>du", ":DBUIToggle<CR>", default_opts)
keymap("n", "<Leader>df", ":DBUIFindBuffer<CR>", default_opts)
keymap("n", "<Leader>dr", ":DBUIRenameBuffer<CR>", default_opts)
keymap("n", "<Leader>dl", ":DBUILastQueryInfo<CR>", default_opts)

-- Testing
keymap("n", "<Leader>t", ":TestNearest<CR>", default_opts)
keymap("n", "<Leader>T", ":TestFile<CR>", default_opts)
keymap("n", "<Leader>a", ":TestSuite<CR>", default_opts)
keymap("n", "<Leader>l", ":TestLast<CR>", default_opts)
keymap("n", "<Leader>g", ":TestVisit<CR>", default_opts)

-- Generate UUID
keymap("n", "<Leader>u", ":Nuuid<CR>", default_opts)

-- Easier window switching. TODO: C-h conflicts with coq plugin
keymap("n", "<C-h>", "<C-w>h", default_opts) 
keymap("n", "<C-k>", "<C-k>k", default_opts)
keymap("n", "<C-j>", "<C-j>j", default_opts)
keymap("n", "<C-l>", "<C-w>l", default_opts)

-- Better escape using jj in insert and terminal mode
keymap("i", "jj", "<ESC>", default_opts)
keymap("t", "jj", "<C-\\><C-n>", default_opts)

-- Center search results
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Visual line wraps
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", expr_opts)
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", expr_opts)

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)

-- Switch buffer
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
keymap("n", "<S-l>", ":bnext<CR>", default_opts)

-- Cancel search highlighting with ESC
keymap("n", "<ESC>", ":nohlsearch<Bar>:echo<CR>", default_opts)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)

-- Resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>", default_opts)
keymap("n", "<Right>", ":vertical resize -1<CR>", default_opts)
keymap("n", "<Up>", ":resize -1<CR>", default_opts)
keymap("n", "<Down>", ":resize +1<CR>", default_opts)
