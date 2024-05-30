return {
    "folke/zen-mode.nvim",
    dependencies = { "folke/twilight.nvim" },
    keys = {
        { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen mode" },
        { "<leader>tw", "<cmd>Twilight<cr>", desc = "twilight mode" },
    },
    config = true,
}
