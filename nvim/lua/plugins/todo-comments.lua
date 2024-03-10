return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    -- TODO: should have all the plugins setup once
    config = function()
        require("todo-comments").setup({
            vim.keymap.set("n", "<leader>t", "<cmd>TodoTelescope<cr>", { silent = true, noremap = true }),
        })
    end,
}
