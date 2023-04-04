return {
	"edkolev/tmuxline.vim",
	config = function()
		vim.g["airline#extensions#tmuxline#enabled"] = 1
		vim.g.tmuxline_powerline_separators = 0
	end,
}
