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
                java = { "google-java-format" },
                javascript = { "prettier" },
                typescript = { "prettier" },
                javascriptreact = { "prettier" },
                typescriptreact = { "prettier" },
                css = { "prettier" },
                html = { "prettier" },
                json = { "prettier" },
                yaml = { "prettier" },
                markdown = { "prettier" },
                astro = { "prettier" },
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
                ["google-java-format"] = {
                    prepend_args = { "--aosp" }, -- Ensure 4-space indentation
                },
            },
        })
        conform.setup({
            format_on_save = {
                timeout_ms = 3000,
                lsp_format = "never",
            },
        })
    end,
}
