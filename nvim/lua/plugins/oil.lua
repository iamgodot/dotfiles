return {
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("oil").setup({
                view_options = {
                    show_hidden = true,
                },
                float = {
                    max_height = 25,
                    max_width = 75,
                },
            })
            vim.keymap.set("n", "<leader>e", ":Oil --float<CR>", { noremap = true })
        end,
    },
}
