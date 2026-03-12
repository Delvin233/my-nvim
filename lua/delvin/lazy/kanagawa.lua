return{
	'rebelot/kanagawa.nvim',
	config = function ()
		require('kanagawa').setup({theme = 'dragon', transparent = true
	})
		-- vim.o.termguicolors = true
		vim.cmd('colorscheme kanagawa-dragon')
		vim.api.nvim_set_hl(0, 'SignColumn', { link = 'Normal' })
	end
}
