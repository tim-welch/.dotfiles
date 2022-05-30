local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    print("null-ls not available")
    return
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettier,
        formatting.black,
        formatting.shfmt,
        formatting.clang_format,
        formatting.cmake_format,
        formatting.dart_format,
        formatting.isort,
        formatting.codespell.with({ filetypes = { "markdown" } }),
        diagnostics.flake8,
        diagnostics.jsonlint,
    },
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()")
        end
        vim.cmd([[
      augroup document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]   )
    end,
})
