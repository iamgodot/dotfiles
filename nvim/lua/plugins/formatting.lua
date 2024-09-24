return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        -- TODO: let Mason handle installation of formatters
        conform.setup({
            formatters_by_ft = {
                c = { "clang-format" },
                lua = { "stylua" },
                python = { "black" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                ["_"] = { "trim_newlines", "trim_whitespace" },
            },
            formatters = {
                stylua = {
                    prepend_args = { "--indent-type", "Spaces" },
                },
                black = {
                    condition = function(self, ctx)
                        return string.match(ctx.filename, "source") == nil
                    end,
                },
                prettier = {
                    condition = function(self, ctx)
                        return string.match(ctx.filename, "source") == nil
                    end,
                },
            },
        })
        conform.setup({
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "never",
            },
        })
    end,
}
