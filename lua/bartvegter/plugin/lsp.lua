return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
      { 'Bilal2453/luvit-meta', lazy = true },
      { 'j-hui/fidget.nvim',    opts = {} },
    },

    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      require("lspconfig").lua_ls.setup({ capabilities = capabilities })

      require("lspconfig").nixd.setup({
        cmd = { "nixd" },
        capabilities = capabilities,
        settings = {
          nixd = {
            nixpkgs = {
              expr = "import <nixpkgs> { }",
            },
            formatting = {
              command = { "nixfmt" },
            },
            -- options = {
            --   nixos = {
            --       expr = "(builtins.getFlake "/PATH/TO/FLAKE").nixosConfigurations.CONFIGNAME.options",
            --   },
            --   home_manager = {
            --       expr = "(builtins.getFlake "/PATH/TO/FLAKE").homeConfigurations.CONFIGNAME.options",
            --   },
            -- },
          },
        },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "LSP actions",
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then return end

          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
              end
            })
          end

          vim.keymap.set('n', 'K', vim.lsp.buf.hover,
            { buffer = args.buf, desc = "Signature help" })
          vim.keymap.set('n', '<leader>cq', vim.diagnostic.setqflist,
            { buffer = args.buf, desc = '[C]ode Diagnostics [Q]uickfix' })

          if client.supports_method("textDocument/code_action") then
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,
              { buffer = args.buf, desc = "[C]ode [A]ctions" })
          end
          if client.supports_method("textDocument/rename") then
            vim.keymap.set("n", "<leader>cn", vim.lsp.buf.rename,
              { buffer = args.buf, desc = "[C]ode [R]ename" })
          end
          if client.supports_method("textDocument/references") then
            vim.keymap.set("n", "<leader>cr", vim.lsp.buf.references,
              { buffer = args.buf, desc = "[C]ode [R]eferences" })
          end
          if client.supports_method("textDocument/definition") then
            vim.keymap.set('n', '<leader>cd', vim.lsp.buf.definition,
              { buffer = args.buf, desc = "[C]ode [D]efinition" })
          end
          if client.supports_method("textDocument/declaration") then
            vim.keymap.set('n', '<leader>cD', vim.lsp.buf.declaration,
              { buffer = args.buf, desc = "[C]ode [D]eclaration" })
          end
          if client.supports_method("textDocument/implementation") then
            vim.keymap.set('n', '<leader>ci', vim.lsp.buf.implementation,
              { buffer = args.buf, desc = "[C]ode [I]mplementation" })
          end
          if client.supports_method("textDocument/type_definition") then
            vim.keymap.set('n', '<leader>ct', vim.lsp.buf.type_definition,
              { buffer = args.buf, desc = "[C]ode [T]ype definition" })
          end
          if client.supports_method("textDocument/signature_help") then
            vim.keymap.set("n", "<leader>cs", vim.lsp.buf.signature_help,
              { buffer = args.buf, desc = "[C]ode [S]ignature help" })
          end
        end,
      })
    end,

  }
}
