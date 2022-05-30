local status_ok, ap = pcall(require, "nvim-autopairs")
if not status_ok then
    print("nvim-autopairs not available")
    return
end

ap.setup{}
