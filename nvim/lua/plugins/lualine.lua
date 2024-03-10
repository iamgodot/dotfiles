return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local lualine = require("lualine")
        lualine.setup({
            options = {
                theme = "solarized_dark",
                section_separators = "",
                component_separators = "",
                file_status = true,
                path = 1,
                symbols = {
                    modified = "[Modified]",
                    readonly = "[Read-only]",
                    unnamed = "[No Name]",
                    newfile = "[New]",
                },
            },
        })
    end,
}
