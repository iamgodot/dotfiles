return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        dashboard = {
            enabled = true,
            preset = {
                keys = {
                    { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                    { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                    {
                        icon = " ",
                        key = "g",
                        desc = "Find Text",
                        action = ":lua Snacks.dashboard.pick('live_grep')",
                    },
                    {
                        icon = " ",
                        key = "r",
                        desc = "Recent Files",
                        action = ":lua Snacks.dashboard.pick('oldfiles')",
                    },
                    {
                        icon = " ",
                        key = "c",
                        desc = "Config",
                        action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
                    },
                    { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                    {
                        icon = "󰒲 ",
                        key = "l",
                        desc = "Lazy",
                        action = ":Lazy",
                        enabled = package.loaded.lazy ~= nil,
                    },
                    { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                },
            },
            sections = {
                { section = "header" },
                { section = "keys", gap = 1, padding = 2 },
                { icon = " ", title = "Recent Files", section = "recent_files", indent = 0, padding = { 2, 1 } },
                { icon = " ", title = "Projects", section = "projects", indent = 0, padding = { 2, 1 } },
                { section = "startup" },
            },
        },
        indent = { enabled = true },
        quickfile = { enabled = true },
        statuscolumn = { enabled = true, folds = { open = true } },
        terminal = { enabled = true },
    },
    keys = {
        {
            "<leader>dd",
            function()
                Snacks.dashboard.open()
            end,
            desc = "Toggle Dashboard",
        },
        {
            "<C-t>",
            function()
                Snacks.terminal()
            end,
            desc = "Toggle Terminal",
        },
    },
}
