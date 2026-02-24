return {
  {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,

    opts = {
      filter = "pro", -- classic | octagon | pro | machine | ristretto | spectrum
    },

    -- Run after the plugin is loaded
    config = function(_, opts)
      require("monokai-pro").setup(opts)
      vim.cmd("colorscheme monokai-pro")
    end,
  },
}
