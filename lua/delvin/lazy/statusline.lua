return {
  {
    'echasnovski/mini.statusline',
	-- dependencies = { "nvim-tree/nvim-web-devicons"},
    version = false,
    config = function()
      require('mini.statusline').setup({
        use_icons = true, -- enables the LazyVim icon look
      })
    end,
  },
}
