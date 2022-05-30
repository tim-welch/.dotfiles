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
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    }
}

