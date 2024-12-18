return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
        "nvim-lua/plenary.nvim",
        { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
        "debugloop/telescope-undo.nvim",
    },
    keys = {
        { "<leader>u", "<cmd>Telescope undo<cr>", desc = "[S]earch [U]ndos" },
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

        -- See `:help telescope.builtin`
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "[ ] Find existing buffers" })
        vim.keymap.set("n", "<leader>/", function()
            builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
                winblend = 10,
                previewer = false,
            }))
        end, { desc = "[/] Fuzzily search in current buffer" })
        vim.keymap.set(
            "n",
            "<leader>p",
            "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
            { desc = "[S]earch [F]iles" }
        )
        vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "[S]earch [H]elp" })
        vim.keymap.set("n", "<leader>w", builtin.grep_string, { desc = "[S]earch current [W]ord" })
        vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = "[S]earch by [G]rep" })
        vim.keymap.set("n", "<leader>k", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
        vim.keymap.set("n", "<leader>cm", builtin.commands, { desc = "[S]earch [C]ommands" })
        vim.keymap.set("n", "<leader>cs", builtin.colorscheme, { desc = "[S]earch [C]olorschemes" })
        vim.keymap.set("n", "<leader>v", builtin.vim_options, { desc = "[S]earch [V]im options" })
    end,
}
