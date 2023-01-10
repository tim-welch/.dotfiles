vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move highlighted lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep cursor in place
vim.keymap.set("n", "J", "mzJ`z") -- when joining lines
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- when moving 1/2 screen down
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- when moving 1/2 screen up
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste over selection but keep the current clipboard intact
vim.keymap.set("x", "<leader>p", "\"_dP")

-- yank to system clipboard: asbjornHaland
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- delete to null registor (don't put in clipboard)
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>Y", "\"+Y")

-- disable capital Q
vim.keymap.set("n", "Q", "<nop>")

-- create a new tmux window
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww<CR>")

-- format current buffer
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- quick fix navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search and replace current word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- mark current file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
