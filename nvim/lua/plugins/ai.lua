return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
    },
    keys = {
        {
            "<leader>a",
            "<cmd>CodeCompanionChat Toggle<cr>",
            mode = { "n", "v" },
            desc = "CodeCompanionChat Toggle",
        },
        {
            "<C-a>",
            "<cmd>CodeCompanionActions<cr>",
            mode = { "n", "v" },
            desc = "CodeCompanionActions",
        },
    },
    config = function()
        require("codecompanion").setup({
            strategies = {
                chat = {
                    adapter = "anthropic",
                    keymaps = {
                        close = {
                            modes = {
                                n = "<C-d>",
                                i = "<C-d>",
                            },
                            index = 4,
                            callback = "keymaps.close",
                            description = "Close Chat",
                        },
                    },
                },
                inline = {
                    adapter = "anthropic",
                },
            },
            adapters = {
                anthropic = function()
                    return require("codecompanion.adapters").extend("anthropic", {
                        env = {
                            api_key = "",
                        },
                    })
                end,
            },
        })
    end,
}
