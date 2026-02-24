return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    event = { "VeryLazy" },
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter",
        lazy = true,
        event = { "VeryLazy" },
      },
      {
        "nvim-tree/nvim-web-devicons",
        lazy = true,
        event = { "VeryLazy" },
      },
    },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
}
