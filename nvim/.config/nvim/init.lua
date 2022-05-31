require("my/packages")
require("my/options")
require("my/colorscheme")
require("my/alpha")
require("my/treesitter")
require("my/null-ls")
require("my/autopair")
require("my/toggleterm")
require("my/web-devicons")
require("my/lualine")
require("my/which-key")
require("my/completion")
require("my/lsp")
require("my/keybindings")

-- if (vim.loop.os_uname().sysname == 'Linux') then
--     -- Linux specific configuration
-- end

if vim.env.TMUX then
    require("my/tmux-clipboard")
end
