local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.o.termguicolors = true

-- Set Python provider for faster startup
vim.g.python3_host_prog = "/usr/local/bin/python3"

-- [[ Lightspeed ]]
-- According to doc, have to custom before plugin loading
-- Or we need to unset/noremap after it, e.g.
-- vim.keymap.set('n', 's', 's', { noremap = true })
vim.keymap.set("n", "<leader>s", "<Plug>Lightspeed_s")
vim.keymap.set("n", "<leader>S", "<Plug>Lightspeed_S")

require("lazy").setup({
    spec = {
        -- Colorschemes
        { "liuchengxu/space-vim-dark" },
        { "joshdick/onedark.vim" },
        { "overcache/NeoSolarized" },
        { "folke/tokyonight.nvim" },
        { "catppuccin/nvim" },
        { "rose-pine/neovim" },

        -- Miscellaneous
        { "tpope/vim-surround" },
        { "ggandor/lightspeed.nvim" },

        { import = "plugins" },
    },
    defaults = { lazy = false, version = false },
    checker = { enabled = true, notify = false },
    change_detection = { enabled = true, notify = false },
})
