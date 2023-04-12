return {
    "tpope/vim-fugitive",
    -- 'tpope/vim-rhubarb',
    config = function()
        vim.keymap.set("n", "gs", ":G<CR>", { noremap = true })
        vim.keymap.set("n", "gh", ":diffget //3<CR>", { noremap = true })
        vim.keymap.set("n", "gu", ":diffget //2<CR>", { noremap = true })
    end,
}
