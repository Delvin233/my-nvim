return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",  --TODO: i guess it need : to work
	config = function()
		-- RENAME THIS: configs -> config
		local config = require("nvim-treesitter.config")

		config.setup({
			ensure_installed = {
				"gdscript",
				"godot_resource",
				"gdshader",
				"cpp",
				"c",
				"vim",
				"vimdoc",
				"python",
				"lua",
				"rust",
				"query",
				'help',
			},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
			indent = { 
				enable = true 
			},
		})
	end,
}

