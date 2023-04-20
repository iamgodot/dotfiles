return {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local null_ls = require("null-ls")
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        null_ls.setup({
            debug = false,
            sources = {
                null_ls.builtins.formatting.black.with({
                    runtime_condition = function(params)
                        return string.match(params.bufname, "source") == nil
                    end,
                }),
                null_ls.builtins.formatting.ruff.with({
                    extra_args = { "--select", "I" },
                    runtime_condition = function(params)
                        return string.match(params.bufname, "source") == nil
                    end,
                }),
                null_ls.builtins.formatting.stylua.with({
                    extra_args = { "--indent-type", "Spaces" },
                }),
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
                            vim.lsp.buf.format({ bufnr = bufnr })
                        end,
                    })
                end
            end,
        })
    end,
}
