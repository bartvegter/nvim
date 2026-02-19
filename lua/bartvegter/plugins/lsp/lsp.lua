return {

	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			-- list LSP servers to install
			ensure_installed = {
				"bashls",
				"cssls",
				"dockerls",
				"docker_compose_language_service",
				"eslint",
				"html",
				"lua_ls",
				"svelte",
				"tailwindcss",
				"ts_ls",
				"yamlls",
			},
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = {
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				},
			},
			"neovim/nvim-lspconfig",
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		opts = {
			ensure_installed = {
				"prettierd", -- prettier formatter as daemon
				"prettier", -- prettier formatter as backup for prettierd
				"stylua", -- lua formatter
				"isort", -- python formatter
				"black", -- python formatter
				"pylint",
				"eslint_d",
				"shfmt",
				"shellcheck",
			},
		},
		dependencies = {
			"williamboman/mason.nvim",
		},
	},
}
