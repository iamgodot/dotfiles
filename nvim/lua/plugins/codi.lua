return {
	"metakirby5/codi.vim",
	config = function()
		vim.g["codi#interpreters"] = {
			python = {
				bin = "python3",
				prompt = "^\\(>>>\\|\\.\\.\\.\\) ",
			},
		}
	end,
}
