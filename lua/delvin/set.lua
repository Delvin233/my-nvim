vim.opt.guicursor = ''
vim.g.mapleader = ' '

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

vim.opt.breakindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.incsearch = true
vim.termguicolors = true

vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
-- vim.opt.clipboard = "unnamedplus"

vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "100"

vim.opt.updatetime = 150
vim.opt.timeoutlen = 1000

vim.opt.scrolloff = 10
vim.opt.cursorline = true

vim.opt.swapfile = false

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
