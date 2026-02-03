return {
    "mason-org/mason.nvim",
    dependencies = {
        "mason-org/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        mason.setup({
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        })
        require("mason-tool-installer").setup({
            ensure_installed = {
                "google-java-format",
                "clang-format",
                "eslint_d",
                "prettier",
                "stylua",
                "black",
            },
        })
        mason_lspconfig.setup({
            ensure_installed = {
                "pyright",
                "ruff",
                "lua_ls",
                "vtsls",
                "emmet_language_server",
                "prismals",
                "clangd",
                "astro",
                "jdtls",
            },
            automatic_enable = false,
        })
    end,
}
