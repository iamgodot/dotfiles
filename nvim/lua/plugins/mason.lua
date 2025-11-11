return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
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
                "clang-format",
                "eslint_d",
                "prettier",
                "black",
            },
        })
        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "pyright",
                "lua_ls",
                "ruff",
                "vtsls",
                "emmet_language_server",
                "prismals",
                "clangd",
                "astro",
                "jdtls",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
            automatic_enable = { exclude = { "jdtls" } },
        })
    end,
}
