return{
	'rebelot/kanagawa.nvim',
	config = function ()
		require('kanagawa').setup({theme = 'dragon', transparent = true
	})
		-- vim.o.termguicolors = true
		-- vim.cmd('colorscheme kanagawa-dragon')
	end
}

-- I sacrificed you for rose-pine : )
