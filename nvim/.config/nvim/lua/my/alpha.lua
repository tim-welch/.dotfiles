local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
    print("alpha not available")
    return
end

local status_ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not status_ok then
    print("alpha.themes.dashboard not available")
    return
end

local opts = { noremap = true, silent = false }
dashboard.section.header.val = {
    [[                               __                ]],
    [[  ___     ___    ___   __  __ /\_\    ___ ___    ]],
    [[ / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\  ]],
    [[/\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \ ]],
    [[\ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\]],
    [[ \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/]],
}
dashboard.section.buttons.val = {
    dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>", opts),
    dashboard.button( "f", "  Find file" , ":Telescope find_files<CR>", opts),
    dashboard.button( "g", "  Find git file" , ":Telescope git_files<CR>", opts),
    dashboard.button( "r", "  Recently used files" , ":Telescope oldfiles<CR>", opts),
    dashboard.button( "t", "  Find text" , ":Telescope live_grep<CR>", opts),
    dashboard.button( "c", "  Configuration", ":e ~/.config/nvim/init.lua<CR>", opts),
    dashboard.button( "q", "  Quit NVIM" , ":qa<CR>", opts),
}
dashboard.config.opts.noautocmd = true
dashboard.section.buttons.opts.hl = "Keyword"
alpha.setup(dashboard.config)
