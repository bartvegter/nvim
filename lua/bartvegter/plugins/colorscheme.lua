return {
	{
		"ellisonleao/gruvbox.nvim",
		enabled = false,
		priority = 1000,
		config = function()
			require("gruvbox").setup({
				overrides = {
					SignColumn = { bg = "#282828" },
				},
			})
			vim.cmd.colorscheme("gruvbox")
		end,
	},
	{
		"sainnhe/gruvbox-material",
		enabled = false,
		lazy = false,
		priority = 1000,
		config = function()
			-- Optionally configure and load the colorscheme
			-- directly inside the plugin declaration.
			vim.g.gruvbox_material_enable_italic = true
			vim.cmd.colorscheme("gruvbox-material")
		end,
	},
	{
		"loctvl842/monokai-pro.nvim",
		enabled = true,
		priority = 1000,
		config = function()
			require("monokai-pro").setup({
				filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
			})
			vim.cmd.colorscheme("monokai-pro")
		end,
	},
	{
		"catppuccin/nvim",
		enabled = false,
		name = "catppuccin",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
