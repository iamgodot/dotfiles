return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		-- Have to do this according to official doc
		require("nvim-tree").setup({})

		-- Disable netrw at the very start of your init.lua (strongly advised)
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		vim.keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>", { noremap = true })
	end,
}
