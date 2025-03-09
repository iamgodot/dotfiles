return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "debugloop/telescope-undo.nvim",
    },
    keys = {
        { "<leader>u", "<cmd>Telescope undo<cr>", desc = "Telescope undos" },
        {
            "<leader>p",
            "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
            desc = "Telescope find files",
        },
        { "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
        {
            "<leader>/",
            "<cmd>lua require'telescope.builtin'.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown({winblend=10,previewer=false}))<cr>",
            desc = "Telescope fuzzy find in current buffer",
        },
        { "<leader>h", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
        { "<leader>w", "<cmd>Telescope grep_string<cr>", desc = "Telescope grep string" },
        { "<leader>f", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
        { "<leader>k", "<cmd>Telescope keymaps<cr>", desc = "Telescope keymaps" },
        { "<leader>cm", "<cmd>Telescope commands<cr>", desc = "Telescope commands" },
        { "<leader>cs", "<cmd>Telescope colorscheme<cr>", desc = "Telescope colorschemes" },
        { "<leader>v", "<cmd>Telescope vim_options<cr>", desc = "Telescope vim options" },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                prompt_prefix = "   ",
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-d>"] = false,
                        ["<C-j>"] = {
                            require("telescope.actions").move_selection_next,
                            type = "action",
                            opts = { nowait = true, silent = true },
                        },
                        ["<C-k>"] = {
                            require("telescope.actions").move_selection_previous,
                            type = "action",
                            opts = { nowait = true, silent = true },
                        },
                        ["<C-g>"] = {
                            require("telescope.actions").close,
                            type = "action",
                            opts = { nowait = true, silent = true },
                        },
                    },
                },
            },
            extensions = {
                undo = {
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.8,
                    },
                    mappings = {
                        i = {
                            ["<cr>"] = require("telescope-undo.actions").yank_additions,
                            ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                            ["<C-cr>"] = require("telescope-undo.actions").restore,
                            -- alternative defaults, for users whose terminals do questionable things with modified <cr>
                            ["<C-y>"] = require("telescope-undo.actions").yank_deletions,
                            ["<C-r>"] = require("telescope-undo.actions").restore,
                        },
                    },
                },
            },
        })

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("undo")
    end,
}
