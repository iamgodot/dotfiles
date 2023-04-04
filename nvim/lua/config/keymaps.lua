-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

-- Basic
vim.keymap.set("i", "<C-c>", "<ESC>")
vim.keymap.set("n", "<C-p>", ":noh<CR>")

-- Move between panes
vim.keymap.set("n", "<C-j>", ":1wincmd j<CR>", { noremap = true })
vim.keymap.set("n", "<C-k>", ":1wincmd k<CR>", { noremap = true })
vim.keymap.set("n", "<C-h>", ":1wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<C-l>", ":1wincmd l<CR>", { noremap = true })

-- Tabs
vim.keymap.set("n", "tn", ":tabn<CR>")
vim.keymap.set("n", "tp", ":tabp<CR>")
vim.keymap.set("n", "tt", ":tabnew")
vim.keymap.set("n", "tc", ":tabclose")
vim.keymap.set("n", "ts", ":tab split<CR>")
