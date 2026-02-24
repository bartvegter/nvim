return {
  {
    "ibhagwan/fzf-lua",
    event = { "VeryLazy" },
    dependencies = { "nvim-tree/nvim-web-devicons" },

    config = function()
      local fzf = require("fzf-lua")

      if vim.fn.executable("bat") == 1 then
        fzf.setup({
          winopts = {
            preview = {
              default = "bat", -- nice syntax‑highlighted preview
            },
          },
        })
      end

      -----------------------------------------------------------------------
      -- Helper wrappers – keep the same API shape you used in Telescope so
      -- the rest of your config stays readable.
      -----------------------------------------------------------------------
      local function find_files(opts)
        opts = opts or {}
        -- If a cwd is supplied we forward it, otherwise fzf‑lua uses the
        -- current working directory.
        fzf.files(opts)
      end

      local function git_files()
        fzf.git_files()
      end

      local function live_grep()
        fzf.live_grep()
      end

      local function grep_string()
        fzf.grep_cword()
      end

      local function buffers()
        fzf.buffers()
      end

      local function keymaps()
        fzf.keymaps()
      end

      local function help_tags()
        fzf.help_tags()
      end

      local function resume()
        -- fzf‑lua does not have a built‑in “resume” like Telescope.
        -- As a simple approximation we re‑open the last picker that was
        -- invoked.  This works because fzf‑lua keeps the last command in
        -- `fzf.last_cmd`.  If you need richer session restore you can
        -- explore the `fzf.actions` API.
        if fzf.last_cmd then
          fzf.last_cmd()
        else
          vim.notify("No previous fzf command to resume", vim.log.levels.WARN)
        end
      end

      -----------------------------------------------------------------------
      -- Keymaps – direct one‑to‑one replacements for your Telescope bindings
      -----------------------------------------------------------------------
      local map = vim.keymap.set
      local desc = "[fzf] "

      map("n", "<leader>ff", function()
        find_files()
      end, { desc = desc .. "Cwd Files" })

      map("n", "<leader>fG", function()
        git_files()
      end, { desc = desc .. "Git files" })

      map("n", "<leader>fg", function()
        live_grep()
      end, { desc = desc .. "Live grep" })

      map("n", "<leader>fw", function()
        grep_string()
      end, { desc = desc .. "Current word" })

      map("n", "<leader>fr", function()
        resume()
      end, { desc = desc .. "Resume last find" })

      map("n", "<leader>fb", function()
        buffers()
      end, { desc = desc .. "Buffers" })

      map("n", "<leader>fk", function()
        keymaps()
      end, { desc = desc .. "Keymaps" })

      map("n", "<leader>fh", function()
        help_tags()
      end, { desc = desc .. "Help tags" })

      map("n", "<leader>fc", function()
        find_files({ cwd = vim.fn.stdpath("config") })
      end, { desc = desc .. "Find Neovim config" })

      map("n", "<leader>fp", function()
        ---@diagnostic disable-next-line: param-type-mismatch
        find_files({ cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy") })
      end, { desc = desc .. "Find Neovim plugins" })

      map("n", "<leader>/", function()
        fzf.lines({
          winopts = { height = 0.30, width = 0.80, border = "rounded" },
          previewer = false,
        })
      end, { desc = desc .. "Fuzzy find current buffer" })

      map("n", "<leader>f/", function()
        fzf.live_grep({
          rg_opts = "--files --no-ignore --hidden --glob '!{.git,node_modules}/*'",
          prompt = "Live grep in open files > ",
        })
      end, { desc = desc .. "Live grep in open files" })
    end,
  },
}
