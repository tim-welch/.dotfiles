-- Tabs / Indenting
vim.opt.expandtab = true  -- expand tabs to spaces
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Mouse
vim.opt.mouse = "a"  -- all modes

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- use the system clipboard unless a specific register is specified (e.g. "ay)

-- Completion
vim.opt.completeopt = { "menuone", "preview", "noinsert", "noselect" }
vim.opt.updatetime = 300 -- faster completion
vim.opt.shortmess:append "c" -- don't give ins-completion-menu messages

-- Syntax highlighting
vim.opt.conceallevel = 0 -- Text is shown normally

-- Files
vim.opt.fileencoding = "utf-8"
vim.opt.backup = false
vim.opt.writebackup = true
vim.opt.swapfile = false
vim.opt.undofile = true

-- Search
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.tagcase = "followscs"

-- UI
vim.opt.showmode = true -- show "-- INSERT --", etc.
vim.opt.showtabline = 2 -- 0: never, 1: if >1 tab, 2: always
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.timeoutlen = 200 -- Time in ms to wait for a mapped sequence to complete
vim.opt.cursorline = true
vim.opt.cursorlineopt = "line"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 3
vim.opt.scrolloff = 3
