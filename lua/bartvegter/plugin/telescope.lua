return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release",
        cond = function()
          return vim.fn.executable "make" == 1
        end,
      },
      { "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
    },

    config = function()
      require("telescope").setup {
        pickers = {
          diagnostics = {
            theme = "ivy"
          },
          -- find_files = {
          --   theme = "ivy"
          -- },
          -- live_grep = {
          --   theme = "ivy"
          -- },
        },
        extensions = {
          fzf = {
            fuzzy = true
          }
        },
      }

      require("telescope").load_extension("fzf")

      local builtin = require("telescope.builtin")

      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Cwd Files" })
      vim.keymap.set("n", "<leader>fG", builtin.git_files, { desc = "Git files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
      vim.keymap.set("n", "<leader>fw", builtin.grep_string, { desc = "Current word" })
      vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Diagnostics" })
      vim.keymap.set("n", "<leader>fr", builtin.resume, { desc = "Resume last find" })
      vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, { desc = "Keymaps" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })

      vim.keymap.set("n", "<leader>fc", function()
        builtin.find_files {
          cwd = vim.fn.stdpath("config")
        }
      end, { desc = "Find Neovim config" })

      vim.keymap.set("n", "<leader>fp", function()
        builtin.find_files {
          ---@diagnostic disable-next-line: param-type-mismatch
          cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
        }
      end, { desc = "Find Neovim plugins" })

      vim.keymap.set("n", "<leader>/", function()
        -- You can pass additional configuration to Telescope to change the theme, layout, etc.
        builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
          winblend = 10,
          previewer = false,
        })
      end, { desc = "Fuzzy find current buffer" })

      vim.keymap.set("n", "<leader>f/", function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = "Live grep in open files",
        }
      end, { desc = "Live grep in open files" })
    end

  }
}
