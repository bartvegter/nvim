return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		opts = {
			indent = { enable = true },
			highlight = { enable = true },
			folds = { enable = true },
			ensure_installed = {
				"c",
				"lua",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"toml",
				"html",
				"css",
				"svelte",
				"graphql",
				"bash",
				"dockerfile",
				"hyprlang",
				"gitignore",
			},
			auto_install = true,
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
