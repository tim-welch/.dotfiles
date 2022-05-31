local status_ok, ts = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    print("nvim-treesitter not available")
    return
end

ts.setup {
    ensure_installed = { "c", "cpp", "python", "bash", "make",
        "lua", "go", "cmake", "css", "javascript", "haskell", "help",
        "html", "json", "latex", "ledger", "llvm", "markdown",
        "ninja", "nix", "org", "perl", "regex", "todotxt", "toml",
        "vim", "yaml", },
    sync_install = false,
    autopairs = {
        enable = true,
    },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    context_commentstring = {
        enable = true,
    },
    rainbow = {
        enable = true,
        -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        max_file_lines = nil, -- Do not enable for files with more than n lines, int
        -- colors = {}, -- table of hex strings
        -- termcolors = {} -- table of colour name strings
    }
}
