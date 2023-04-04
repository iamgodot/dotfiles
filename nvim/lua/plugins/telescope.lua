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
		vim.keymap.set(
			"n",
			"<leader>o",
			require("telescope.builtin").oldfiles,
			{ desc = "[?] Find recently opened files" }
		)
		vim.keymap.set("n", "<leader>b", require("telescope.builtin").buffers, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>/", function()
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>p", require("telescope.builtin").find_files, { desc = "[S]earch [F]iles" })
		vim.keymap.set("n", "<leader>hh", require("telescope.builtin").help_tags, { desc = "[S]earch [H]elp" })
		vim.keymap.set("n", "<leader>w", require("telescope.builtin").grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set("n", "<leader>f", require("telescope.builtin").live_grep, { desc = "[S]earch by [G]rep" })
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
