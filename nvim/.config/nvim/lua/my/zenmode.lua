local status_ok, zenmode = pcall(require, "zen-mode")
if not status_ok then
    print("zen-mode not available")
    return
end

local status_ok1, twilight = pcall(require, "twilight")
if not status_ok1 then
    print("twilight not available")
    return
end


twilight.setup {
    {
        dimming = { alpha = 0.25, color = { "Normal", "#ffffff" }, inactive = true },
        context = 10,
        treesitter = true,
        expand = { "function", "method", "table", "if_statement" }
    }
}

zenmode.setup({
    window = {
        backdrop = 0.95,
        width = 100,
        height = 0.8,
        options = { signcolumn = "no", number = false, cursorline = false }
    },
    plugins = {
        options = { enabled = true, ruler = false, showcmd = false },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
        tmux = { enabled = false }
    }
})
