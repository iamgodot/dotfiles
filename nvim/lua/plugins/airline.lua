return {
    {
        "vim-airline/vim-airline",
        config = function()
            vim.g.airline_powerline_fonts = 0
            vim.g["airline#extensions#whitespace#enabled"] = 1
            vim.g["airline#extensions#tabline#enabled"] = 1
            vim.g["airline#extensions#ale#enabled"] = 1
            -- show tab number in tab line
            vim.g["airline#extensions#tabline#tab_nr_type"] = 1
        end,
    },
    { "vim-airline/vim-airline-themes" },
}
