return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local null_ls = require('null-ls')
        require('null-ls').setup({
            debug = true,
            sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.trim_newlines,
                null_ls.builtins.formatting.trim_whitespace,
                null_ls.builtins.diagnostics.ruff,
            },
            on_attach = function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            vim.lsp.buf.format()
                        end,
                    })
                end
            end,
        })
    end,
}