return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            -- Add languages to be installed here that you want installed for treesitter
            ensure_installed = {
                "c",
                "cpp",
                "lua",
                "python",
                "vim",
                "javascript",
                "typescript",
                "html",
                "css",
                "regex",
                "astro",
            },
            -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
            auto_install = true,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
