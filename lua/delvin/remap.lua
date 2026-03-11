vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("i", "jj", "<Esc>")

-- Yanking to the Clipboard
vim.keymap.set("n", "<leader>y", '\"+y')
vim.keymap.set("v", "<leader>y", '\"+y')
vim.keymap.set("n", "<leader>yap", '\"+yap')
vim.keymap.set("v", "<leader>yap", '\"+yap')

vim.keymap.set("n", "<C-s>", ":w<CR>")
vim.keymap.set("n", "<leader>qq", ":q<CR>")

vim.keymap.set("n", "<leader>gg", ":LazyGit<CR>")
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc =  "scroll down and center" })
vim.keymap.set("n", "<C-n>", "<C-n>zz", {desc =  "scroll up and center" })


