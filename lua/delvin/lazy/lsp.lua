return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'williamboman/mason.nvim',
        'williamboman/mason-lspconfig.nvim',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/nvim-cmp',
        'windwp/nvim-autopairs',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'j-hui/fidget.nvim',
    },
    config = function()
        local cmp = require('cmp')
        local cmp_lsp = require('cmp_nvim_lsp')
        local capabilities = vim.tbl_deep_extend(
            'force',
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        require('fidget').setup({})
        require('nvim-autopairs').setup({})
        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = { 'clangd', 'lua_ls', 'rust_analyzer', 'gopls' },
            handlers = {
                function(server_name)
                    -- NEW STYLE: Use vim.lsp.config instead of require('lspconfig')
                    vim.lsp.config(server_name, {
                        capabilities = capabilities
                    })
                    vim.lsp.enable(server_name)
                end,
                ['lua_ls'] = function()
                    vim.lsp.config('lua_ls', {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = 'LuaJIT' },
                                diagnostics = { globals = { 'vim' } }
                            }
                        }
                    })
                    vim.lsp.enable('lua_ls')
                end,
            }
        })

        -- Godot 4 setup (Native 0.11 style)
        vim.lsp.config('gdscript', {
            capabilities = capabilities,
            cmd = vim.lsp.rpc.connect("127.0.0.1", 6005),
        })
        vim.lsp.enable('gdscript')

        -- Autocompletion (Same as before)
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        cmp.setup({
            snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if not cmp.get_selected_entry() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        end
                        cmp.confirm()
                    else fallback() end
                end, { 'i', 's' }),
            }),
            sources = cmp.config.sources({ { name = 'nvim_lsp' }, { name = 'luasnip' } }, { { name = 'buffer' } })
        })

        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
    end
}
