return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
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
            ensure_installed = {
                "clang-format",
            },
        })
        mason_lspconfig.setup({
            -- list of servers for mason to install
            ensure_installed = {
                "pyright",
                "lua_ls",
                "ruff_lsp",
                "tsserver",
                "eslint",
                "emmet_language_server",
                "prismals",
                "clangd",
            },
            -- auto-install configured servers (with lspconfig)
            automatic_installation = true, -- not the same as ensure_installed
        })
    end,
}
