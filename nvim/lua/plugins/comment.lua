return {
    "numToStr/Comment.nvim",
    dependencies = {
        "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
        require("ts_context_commentstring").setup({
            enable_autocmd = false,
        })
        require("Comment").setup({
            pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
            toggler = {
                ---Line-comment toggle keymap
                line = "<leader>cc",
                ---Block-comment toggle keymap
                block = "<leader>bc",
            },
            ---LHS of operator-pending mappings in NORMAL and VISUAL mode
            opleader = {
                ---Line-comment keymap
                line = "<leader>c",
            },
        })
    end,
}
