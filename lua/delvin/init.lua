-- 1. Load your modular settings
require('delvin.set')
require('delvin.remap')
require('delvin.lazy_init')

-- 2. Define the Custom Autocommands
local augroup = vim.api.nvim_create_augroup
local DelvinGroup = augroup('Delvin', { clear = true })
local autocmd = vim.api.nvim_create_autocmd

-- Helper to reload modules (requires plenary)
function R(name)
    require('plenary.reload').reload_module(name)
end

-- 3. LSP Keymaps (only active when an LSP attaches to a file)
autocmd('LspAttach', {
    group = DelvinGroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        
        -- Navigation
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        
        -- Actions & Documentation
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>vca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>vrr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<leader>vrn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>vws', vim.lsp.buf.workspace_symbol, opts)
        
        -- Help in Insert Mode
        vim.keymap.set('i', '<C-h>', vim.lsp.buf.signature_help, opts)

        -- Diagnostics (Errors/Warnings)
        vim.keymap.set('n', '<leader>vd', vim.diagnostic.open_float, opts)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { buffer = e.buf, desc = 'Prev Diagnostic' })
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { buffer = e.buf, desc = 'Next Diagnostic' })
    end
})

vim.cmd('highlight LineNr guibg=bg ctermbg=NONE')
vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
-- vim.cmd('highlight CursorLineNr guibg=NONE ctermbg=NONE')
