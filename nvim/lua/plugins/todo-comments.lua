return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>t",
            function()
                Snacks.picker.todo_comments()
            end,
            desc = "Todo-comments",
        },
    },
    config = true,
    lazy = false,
}
