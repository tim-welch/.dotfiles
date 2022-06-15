local status_ok, lspconf = pcall(require, "lspconfig")
if not status_ok then
    return
end

local status_ok1, cmplsp = pcall(require, "cmp_nvim_lsp")
if not status_ok1 then
    print("cmp-nvim-lsp is not installed")
    return
end

local status_ok2, lspinst = pcall(require, "nvim-lsp-installer")
if not status_ok2 then
    print("nvim-lsp-installer is not installed")
    return
end


local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
end

local capabilities = cmplsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local servers = { "clangd", "sumneko_lua" }
lspinst.setup { ensure_installed = servers }
for _, lsp in pairs(servers) do
    lspconf[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities
    }
end

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

lspconf.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}
