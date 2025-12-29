return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			preset = "modern", -- classic, modern or helix
			spec = {
				{ "<leader>c", group = "Code" },
				{ "<leader>f", group = "Find" },
				{ "<leader>g", group = "Git" },
				{ "<leader>x", group = "Diagnostics/quickfix" },
				{ "<leader>n", group = "Notifications" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "List keymaps for current buffer",
			},
		},
	},
}
