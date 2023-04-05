Plugin = {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		-- Enable telescope fzf native, if installed
		pcall(require("telescope").load_extension, "fzf")

		local telescope = require("telescope")
		local actions = require("telescope.actions")
		telescope.setup({
			defaults = {
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
		})

		-- See `:help telescope.builtin`
		builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>b", builtin.buffers, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>/", function()
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })
		vim.keymap.set("n", "<leader>p", builtin.find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>h", builtin.help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>w", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>f", builtin.live_grep, { desc = "[S]earch by [G]rep" })
		vim.keymap.set("n", "<leader>k", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
		vim.keymap.set("n", "<leader>cm", builtin.commands, { desc = "[S]earch [C]ommands" })
		vim.keymap.set("n", "<leader>cs", builtin.colorscheme, { desc = "[S]earch [C]olorschemes" })
		vim.keymap.set("n", "<leader>v", builtin.vim_options, { desc = "[S]earch [V]im options" })
		vim.keymap.set("n", "<leader>g", builtin.git_commits, { desc = "[S]earch [G]it commits" })
	end,
}

return {
	Plugin,
	{
		"nvim-telescope/telescope-fzf-native.nvim",
		build = "make",
		cond = function()
			return vim.fn.executable("make") == 1
		end,
	},
}
