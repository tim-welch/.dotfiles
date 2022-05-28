-- https://rumpelsepp.org/blog/nvim-clipboard-through-ssh/
vim.g.clipboard = {
    name = 'tmux',
    copy = {
        ["+"] = {'tmux', 'load-buffer', '-w', '-'},
        ["*"] = {'tmux', 'load-buffer', '-w', '-'},
    },
    paste = {
        ["+"] = {'bash', '-c', 'tmux refresh-client -l && sleep 0.2 && tmux save-buffer -'},
        ["*"] = {'bash', '-c', 'tmux refresh-client -l && sleep 0.2 && tmux save-buffer -'},
    },
    cache_enabled = false,
}
