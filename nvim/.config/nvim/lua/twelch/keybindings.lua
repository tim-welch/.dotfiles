-- Key binding helpers
local keymap = vim.api.nvim_set_keymap
local noremap = { noremap = true }

-- CTRL-j,k,h,l move between windows
keymap('n', '<c-j>', '<c-w>j', noremap)
keymap('n', '<c-k>', '<c-w>k', noremap)
keymap('n', '<c-h>', '<c-w>h', noremap)
keymap('n', '<c-l>', '<c-w>l', noremap)


