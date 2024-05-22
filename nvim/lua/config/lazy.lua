local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
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
vim.g.python3_host_prog = "~/.pyenv/versions/3.11.3/envs/neovim/bin/python3"

require("lazy").setup({
    { "folke/neodev.nvim", config = true },
    -- Colorschemes
    { "liuchengxu/space-vim-dark" },
    { "joshdick/onedark.vim" },
    { "folke/tokyonight.nvim" },
    { "catppuccin/nvim" },
    { "rose-pine/neovim" },
    -- Miscellaneous
    { "github/copilot.vim" },
    { import = "plugins" },
}, {
    defaults = { lazy = false },
    checker = { enabled = true, notify = false },
    change_detection = { enabled = true, notify = false },
})
