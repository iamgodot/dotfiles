return {
    "NeogitOrg/neogit",
    keys = {
        { "gs", "<cmd>Neogit<cr>", desc = "Neogit" },
        { "df", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim", -- required
        "sindrets/diffview.nvim", -- optional - Diff integration
        "folke/snacks.nvim", -- optional
    },
    config = true,
    opts = { view = { merge_tool = { layout = "diff3_mixed" } } },
}
