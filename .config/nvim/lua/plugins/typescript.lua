return {
  -- typescript-tools: Better TS performance than ts_ls
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        tsserver_file_preferences = {
          includeInlayParameterNameHints = "all",
          includeInlayVariableTypeHints = true,
          includeInlayFunctionLikeReturnTypeHints = true,
          includeCompletionsForModuleExports = true,
        },
        complete_function_calls = true,
        expose_as_code_action = "all",
      },
    },
  },

  -- lspsaga: Better UI for LSP (hover, code actions, etc) - NOT diagnostics
  {
    "nvimdev/lspsaga.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
    event = "LspAttach",
    opts = {
      ui = {
        border = "rounded",
        code_action = "💡",
      },
      hover = {
        max_width = 0.6,
        max_height = 0.6,
      },
      lightbulb = {
        enable = false,
      },
      -- Disable lspsaga diagnostics (using tiny-inline-diagnostic instead)
      diagnostic = {
        enable = false,
      },
    },
    keys = {
      { "K", function() require("better-type-hover").better_type_hover() end, desc = "Hover doc (expanded types)" },
      { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Go to definition" },
      { "gD", "<cmd>Lspsaga peek_definition<cr>", desc = "Peek definition" },
      { "gr", "<cmd>Lspsaga finder<cr>", desc = "Find references" },
      { "<leader>la", "<cmd>Lspsaga code_action<cr>", desc = "Code action" },
      { "<leader>lr", "<cmd>Lspsaga rename<cr>", desc = "Rename" },
      { "]d", "<cmd>Lspsaga diagnostic_jump_next<cr>", desc = "Next diagnostic" },
      { "[d", "<cmd>Lspsaga diagnostic_jump_prev<cr>", desc = "Prev diagnostic" },
    },
  },

  -- better-type-hover: Expand type aliases with Ctrl+T
  {
    "Sebastian-Nielsen/better-type-hover",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      openTypeDocKeymap = "<C-t>",
      fallback_to_old_on_anything_but_interface_and_type = true,
    },
  },

  -- Better diagnostic display (inline, colored)
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    opts = {
      preset = "modern",
      options = {
        show_source = true,
        multilines = true,
      },
    },
    config = function(_, opts)
      require("tiny-inline-diagnostic").setup(opts)
      vim.diagnostic.config({ virtual_text = false })
    end,
  },
}
