-- Key binding helpers
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- CTRL-j,k,h,l move between windows
keymap('n', '<c-j>', '<c-w>j', opts)
keymap('n', '<c-k>', '<c-w>k', opts)
keymap('n', '<c-h>', '<c-w>h', opts)
keymap('n', '<c-l>', '<c-w>l', opts)

-- Resize windows
keymap('n', '<c-a-j>', ":resize -2<CR>", opts)
keymap('n', '<c-a-k>', ":resize +2<CR>", opts)
keymap('n', '<c-a-h>', ":vertical resize -2<CR>", opts)
keymap('n', '<c-a-l>', ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap('n', "<S-l>", ":bnext<CR>", opts)
keymap('n', "<S-h>", ":bprevious<CR>", opts)

-- In visual mode, keep selection while indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Display welcome screen
keymap("n", "<c-n>", ":Alpha<CR>", opts)

-- Source the current lua file
keymap("n", "<c-s", ":source %", opts)

