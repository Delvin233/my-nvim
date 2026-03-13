require('delvin.set')
require('delvin.remap')
require('delvin.lazy_init')
require('delvin.lspstuff')

-- 2. Define the Custom Autocommands
vim.cmd('highlight LineNr guibg=bg ctermbg=NONE')
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
-- vim.cmd('highlight CursorLineNr guibg=NONE ctermbg=NONE')
