return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
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
        sections = {
            lualine_a = {
                {
                    require("noice").api.status.mode.get,
                    cond = require("noice").api.status.mode.has,
                },
                "mode",
            },
        },
    },
}
