-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
-- Move between panes
vim.keymap.set("n", "<leader>j", ":1wincmd j<CR>", { noremap = true })
vim.keymap.set("n", "<leader>k", ":1wincmd k<CR>", { noremap = true })
vim.keymap.set("n", "<leader>h", ":1wincmd h<CR>", { noremap = true })
vim.keymap.set("n", "<leader>l", ":1wincmd l<CR>", { noremap = true })

-- Tabs
vim.keymap.set("n", "tn", ":tabn<CR>")
vim.keymap.set("n", "tp", ":tabp<CR>")
vim.keymap.set("n", "tt", ":tabnew")
vim.keymap.set("n", "tc", ":tabclose")
vim.keymap.set("n", "ts", ":tab split<CR>")

-- Diagnostic
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })
