-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

-- Basic
vim.keymap.set("i", "<C-c>", "<ESC>")
vim.keymap.set("n", "<C-p>", ":noh<CR>")

-- Tabs
vim.keymap.set("n", "tn", ":tabn<CR>")
vim.keymap.set("n", "tp", ":tabp<CR>")
vim.keymap.set("n", "tt", ":tabnew")
vim.keymap.set("n", "tc", ":tabclose")
vim.keymap.set("n", "ts", ":tab split<CR>")

-- Stay in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move block up&down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Smarter copy&paste
vim.keymap.set("x", "<leader>x", '"_dP')
vim.keymap.set("v", "<leader>y", '"+y')

-- Folding
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
