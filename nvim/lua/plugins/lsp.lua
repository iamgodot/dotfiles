return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        { "williamboman/mason.nvim", build = ":MasonUpdate" },
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- LSP settings.
        -- This function gets run when an LSP connects to a particular buffer.
        require("mason").setup()
        local servers = { "pyright", "lua_ls", "ruff_lsp" }
        require("mason-lspconfig").setup({ ensure_installed = servers })
        local lsp = require("lspconfig")
        -- Python
        local on_attach = function(_, bufnr)
            -- NOTE: Remember that lua is a real programming language, and as such it is possible
            -- to define small helper and utility functions so you don't have to repeat yourself
            -- many times.
            --
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local nmap = function(keys, func, desc)
                if desc then
                    desc = "LSP: " .. desc
                end

                vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
            end

            nmap("<leader>r", vim.lsp.buf.rename, "[R]e[n]ame")

            nmap("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
            nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
            nmap("<leader>j", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
            nmap("<leader>jj", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

            -- See `:help K` for why this keymap
            nmap("K", vim.lsp.buf.hover, "Hover Documentation")

            -- Lesser used LSP functionality
            nmap("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

            -- Mainly to use ruff
            nmap("<space>ca", vim.lsp.buf.code_action, "Code action")
        end
        local capabilities_py = vim.lsp.protocol.make_client_capabilities()
        capabilities_py.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
        lsp["pyright"].setup({
            on_attach = on_attach,
            capabilities = capabilities_py,
        })
        local capabilities_ruff = vim.lsp.protocol.make_client_capabilities()
        lsp["ruff_lsp"].setup({
            on_attach = on_attach,
            capabilities = capabilities_ruff,
            init_options = {
                settings = {
                    args = {
                        "--select",
                        "B,F,E,W,I",
                    },
                },
            },
        })
    end,
}
