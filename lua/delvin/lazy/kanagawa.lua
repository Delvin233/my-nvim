return{
	'rebelot/kanagawa.nvim',
	config = function ()
		require('kanagawa').setup({theme = 'wave', transparent = true
	})
		-- vim.o.termguicolors = true
		-- vim.cmd('colorscheme kanagawa')
	end
}

