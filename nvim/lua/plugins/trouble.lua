return {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("trouble").setup {
            vim.keymap.set("n", "<leader>d", "<cmd>TroubleToggle document_diagnostics<cr>",
                { silent = true, noremap = true }
            )
        }
    end
}
