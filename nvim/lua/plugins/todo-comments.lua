return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        { "<leader>td", "<cmd>TodoTelescope<cr>", desc = "Todo-comments" },
    },
    config = true,
}
