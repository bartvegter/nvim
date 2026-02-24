return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    version = false,
    event = { "VeryLazy" },
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
    -- config = function(_, opts)
    -- 	require("nvim-treesitter.configs").setup(opts)
    -- end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    opts = {
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        keys = {
          goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
          goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
          goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
          goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
        },
      },
    },
  },
  {
    "folke/ts-comments.nvim",
    opts = {},
    event = { "VeryLazy" },
    enabled = vim.fn.has("nvim-0.10.0") == 1,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    opts = {},
  },
}
