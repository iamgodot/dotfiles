return {
    -- LSP Configuration & Plugins
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
        vim.lsp.config("ruff", {
            init_options = {
                settings = {
                    -- Ruff language server settings go here
                },
            },
        })
        vim.lsp.config("pyright", {
            settings = {
                pyright = {
                    -- Using Ruff's import organizer
                    disableOrganizeImports = true,
                },
                python = {
                    analysis = {
                        -- Ignore all files for analysis to exclusively use Ruff for linting
                        ignore = { "*" },
                    },
                },
            },
        })
        vim.lsp.enable("vtsls")
        vim.lsp.enable("emmet_language_server")
        vim.lsp.enable("prismals")
        vim.lsp.enable("clangd")
        vim.lsp.enable("astro")
        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { buffer = ev.buf }
                opts.desc = "Code actions"
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                -- Find other mappings in snacks.lua such as for "gd"
            end,
        })
    end,
}
