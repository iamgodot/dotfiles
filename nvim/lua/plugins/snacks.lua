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
                    {
                        icon = " ",
                        key = "f",
                        desc = "Find File",
                        action = ":lua Snacks.picker.smart()",
                    },
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
                        action = ":lua Snacks.dashboard.pick('files', {cwd = '~/.config/nvim/lua'})",
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
                -- { icon = " ", title = "Recent Files", section = "recent_files", indent = 0, padding = { 2, 1 } },
                -- { icon = " ", title = "Projects", section = "projects", indent = 0, padding = { 2, 1 } },
                { section = "startup" },
            },
        },
        indent = { enabled = true },
        bigfile = {},
        quickfile = { enabled = true },
        statuscolumn = { enabled = true, folds = { open = true, git_hl = true } },
        dim = {},
        input = {},
        terminal = { win = { width = 0.6, height = 0.7, border = "rounded", position = "float" } },
        picker = {
            win = {
                input = {
                    keys = { ["<c-g>"] = { "close", mode = { "n", "i" } }, ["<C-c>"] = "cancel" },
                },
            },
            layout = {
                preset = function()
                    return vim.o.columns >= 120 and "telescope" or "telescope_vertical"
                end,
            },
            layouts = {
                telescope_vertical = {
                    reverse = true,
                    layout = {
                        backdrop = false,
                        width = 0.5,
                        min_width = 80,
                        height = 0.8,
                        min_height = 30,
                        box = "vertical",
                        border = "none",
                        { win = "preview", title = "{preview}", height = 0.5, border = true },
                        { win = "list", title = " Results ", title_pos = "center", border = true },
                        {
                            win = "input",
                            height = 1,
                            border = true,
                            title = "{title} {live} {flags}",
                            title_pos = "center",
                        },
                    },
                },
            },
        },
        gitbrowse = {},
    },
    keys = {
        -- Dashboard
        {
            "<leader>dd",
            function()
                Snacks.dashboard.open()
            end,
            desc = "Toggle Dashboard",
        },
        -- Terminal
        {
            "<C-t>",
            function()
                Snacks.terminal.toggle()
            end,
            desc = "Toggle Terminal",
        },
        -- Dim
        {
            "<leader>di",
            function()
                Snacks.dim()
            end,
            desc = "Enable Dim",
        },
        {
            "<leader>dm",
            function()
                Snacks.dim.disable()
            end,
            desc = "Disable Dim",
        },
        -- Top Pickers & Explorer
        {
            "<leader>p",
            function()
                Snacks.picker.smart()
            end,
            desc = "Smart Find Files",
        },
        {
            "<leader>b",
            function()
                Snacks.picker.buffers()
            end,
            desc = "Buffers",
        },
        {
            "<leader>f",
            function()
                Snacks.picker.grep()
            end,
            desc = "Grep",
        },
        -- find
        {
            "<leader>ff",
            function()
                Snacks.picker.files()
            end,
            desc = "Find Files",
        },
        {
            "<leader>fg",
            function()
                Snacks.picker.git_files()
            end,
            desc = "Find Git Files",
        },
        {
            "<leader>fp",
            function()
                Snacks.picker.projects()
            end,
            desc = "Projects",
        },
        {
            "<leader>fr",
            function()
                Snacks.picker.recent()
            end,
            desc = "Recent",
        },
        -- git
        {
            "<leader>gb",
            function()
                Snacks.picker.git_branches()
            end,
            desc = "Git Branches",
        },
        {
            "<leader>gl",
            function()
                Snacks.picker.git_log()
            end,
            desc = "Git Log",
        },
        {
            "<leader>gL",
            function()
                Snacks.picker.git_log_line()
            end,
            desc = "Git Log Line",
        },
        {
            "<leader>gs",
            function()
                Snacks.picker.git_status()
            end,
            desc = "Git Status",
        },
        {
            "<leader>gS",
            function()
                Snacks.picker.git_stash()
            end,
            desc = "Git Stash",
        },
        {
            "<leader>gd",
            function()
                Snacks.picker.git_diff()
            end,
            desc = "Git Diff (Hunks)",
        },
        {
            "<leader>gf",
            function()
                Snacks.picker.git_log_file()
            end,
            desc = "Git Log File",
        },
        -- gh
        {
            "<leader>gi",
            function()
                Snacks.picker.gh_issue()
            end,
            desc = "GitHub Issues (open)",
        },
        {
            "<leader>gI",
            function()
                Snacks.picker.gh_issue({ state = "all" })
            end,
            desc = "GitHub Issues (all)",
        },
        {
            "<leader>gp",
            function()
                Snacks.picker.gh_pr()
            end,
            desc = "GitHub Pull Requests (open)",
        },
        {
            "<leader>gP",
            function()
                Snacks.picker.gh_pr({ state = "all" })
            end,
            desc = "GitHub Pull Requests (all)",
        },
        {
            "<leader>gg",
            function()
                Snacks.gitbrowse()
            end,
            desc = "GitHub Open in Browser",
        },
        -- Grep
        {
            "<leader>w",
            function()
                Snacks.picker.grep_word()
            end,
            desc = "Visual selection or word",
            mode = { "n", "x" },
        },
        -- Search
        {
            '<leader>"',
            function()
                Snacks.picker.registers()
            end,
            desc = "Registers",
        },
        {
            "<leader>/",
            function()
                Snacks.picker.search_history()
            end,
            desc = "Search History",
        },
        {
            "<leader>l",
            function()
                Snacks.picker.lines()
            end,
            desc = "Buffer Lines",
        },
        {
            "<leader>c",
            function()
                Snacks.picker.command_history()
            end,
            desc = "Command History",
        },
        {
            "<leader>h",
            function()
                Snacks.picker.help()
            end,
            desc = "Help Pages",
        },
        {
            "<leader>k",
            function()
                Snacks.picker.keymaps()
            end,
            desc = "Keymaps",
        },
        {
            "<leader>m",
            function()
                Snacks.picker.man()
            end,
            desc = "Man Pages",
        },
        {
            "<leader>u",
            function()
                Snacks.picker.undo()
            end,
            desc = "Undo History",
        },
        {
            "<leader>cs",
            function()
                Snacks.picker.colorschemes()
            end,
            desc = "Colorschemes",
        },
        -- LSP
        {
            "gd",
            function()
                Snacks.picker.lsp_definitions()
            end,
            desc = "Goto Definition",
        },
        {
            "gD",
            function()
                Snacks.picker.lsp_declarations()
            end,
            desc = "Goto Declaration",
        },
        {
            "gr",
            function()
                Snacks.picker.lsp_references()
            end,
            nowait = true,
            desc = "References",
        },
        {
            "gI",
            function()
                Snacks.picker.lsp_implementations()
            end,
            desc = "Goto Implementation",
        },
        {
            "gy",
            function()
                Snacks.picker.lsp_type_definitions()
            end,
            desc = "Goto T[y]pe Definition",
        },
        {
            "gai",
            function()
                Snacks.picker.lsp_incoming_calls()
            end,
            desc = "C[a]lls Incoming",
        },
        {
            "gao",
            function()
                Snacks.picker.lsp_outgoing_calls()
            end,
            desc = "C[a]lls Outgoing",
        },
        {
            "<leader>ss",
            function()
                Snacks.picker.lsp_symbols()
            end,
            desc = "LSP Symbols",
        },
        {
            "<leader>sS",
            function()
                Snacks.picker.lsp_workspace_symbols()
            end,
            desc = "LSP Workspace Symbols",
        },
    },
}
