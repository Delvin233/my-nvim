return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require("toggleterm").setup({
            -- 15 to 20 lines is usually perfect for the "lower quarter"
            size = 15, 
            -- Shortcut to open/close (Ctrl + \)
            open_mapping = [[<c-/>]], 
            hide_numbers = true,
            shade_terminals = true,
            start_in_insert = true,
            insert_mappings = true,
            terminal_mappings = true,
            persist_size = true,
            -- CHANGE: 'horizontal' puts it at the bottom
            direction = 'horizontal', 
            close_on_exit = true,
            shell = vim.o.shell,
        })

        -- Simple escape from terminal mode
        function _G.set_terminal_keymaps()
            local opts = {buffer = 0}
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        end

        vim.api.nvim_create_autocmd("TermOpen", {
            pattern = "term://*",
            callback = function()
                _G.set_terminal_keymaps()
            end,
        })
    end
}
