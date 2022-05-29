require("packages")
require("options")
require("keybindings")
require("colorscheme")
require("whichkey")

if (vim.loop.os_uname().sysname == 'Linux') then
    -- Linux specific configuration
end

if vim.env.TMUX then
    require("tmux-clipboard")
end
