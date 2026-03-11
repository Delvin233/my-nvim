return {
	'folke/todo-comments.nvim',
	dependencies = { 'nvim-lua/plenary.nvim' },
	opts = {
		signs = false -- This hides the icons in the gutter (the green space we fixed earlier)
	},
	config = function(_, opts)
		require("todo-comments").setup(opts)

		-- Keymap to list all TODOs in your project using Telescope
		vim.keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Search TODOs" })
		
		-- Jump to next/previous TODO
		-- vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
		-- vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })
	end
}

