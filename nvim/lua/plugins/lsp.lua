return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        local lsp = require("lspconfig")
        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            opts.buffer = bufnr

            opts.desc = "Rename"
            vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

            opts.desc = "Go to definition"
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

            opts.desc = "Go to references"
            vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)

            opts.desc = "Document symbols"
            vim.keymap.set("n", "<leader>j", require("telescope.builtin").lsp_document_symbols, opts)

            opts.desc = "Workspace symbols"
            vim.keymap.set("n", "<leader>jj", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)

            opts.desc = "Hover Documentation"
            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

            opts.desc = "Go to declaration"
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

            opts.desc = "Code action"
            vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
        end
        local capabilities_py = vim.lsp.protocol.make_client_capabilities()
        capabilities_py.textDocument.publishDiagnostics.tagSupport.valueSet = { 2 }
        -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
        lsp.pyright.setup({
            on_attach = on_attach,
            capabilities = capabilities_py,
        })
        lsp.ruff_lsp.setup({
            on_attach = on_attach,
            init_options = {
                settings = {
                    args = {
                        "--select",
                        "B,F,E,W,I",
                    },
                },
            },
        })
        lsp.tsserver.setup({
            on_attach = on_attach,
            init_options = {
                preferences = {
                    disableSuggestions = true,
                },
            },
        })
        lsp.lua_ls.setup({
            on_attach = on_attach,
            init_options = {
                workspace = {
                    checkThirdParty = true,
                },
            },
        })
        lsp.tailwindcss.setup({})
        lsp.emmet_language_server.setup({})
        lsp.prismals.setup({})
        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist)

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                opts.desc = "Rename"
                vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)

                opts.desc = "Go to definition"
                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

                opts.desc = "Go to references"
                vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)

                opts.desc = "Document symbols"
                vim.keymap.set("n", "<leader>j", require("telescope.builtin").lsp_document_symbols, opts)

                opts.desc = "Workspace symbols"
                vim.keymap.set("n", "<leader>jj", require("telescope.builtin").lsp_dynamic_workspace_symbols, opts)

                opts.desc = "Hover Documentation"
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts.desc = "Go to declaration"
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts.desc = "Code action"
                vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
            end,
        })
    end,
}
