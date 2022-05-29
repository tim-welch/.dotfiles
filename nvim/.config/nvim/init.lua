require("my/packages")
require("my/options")
require("my/keybindings")
require("my/colorscheme")
require("my/completion")
require("my/which-key")

if (vim.loop.os_uname().sysname == 'Linux') then
    -- Linux specific configuration
end

if vim.env.TMUX then
    require("my/tmux-clipboard")
end
