return {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    keys = {
        {
            "<leader>qs",
            [[<cmd>lua require("persistence").load()<cr>]],
            desc = "Restore for current directory",
        },
        { "<leader>ql", [[<cmd>lua require("persistence").load({ last = true })<cr>]], desc = "Restore last session" },
        { "<leader>qd", [[<cmd>lua require("persistence").stop()<cr>]], desc = "Stop saving session" },
    },
    opts = {
        dir = vim.fn.expand(vim.fn.stdpath("state") .. "/sessions/"), -- directory where session files are saved
        options = { "buffers", "curdir", "tabpages", "winsize" }, -- sessionoptions used for saving
        pre_save = nil, -- a function to call before saving the session
        post_save = nil, -- a function to call after saving the session
        save_empty = false, -- don't save if there are no open file buffers
        pre_load = nil, -- a function to call before loading the session
        post_load = nil, -- a function to call after loading the session
    },
}
