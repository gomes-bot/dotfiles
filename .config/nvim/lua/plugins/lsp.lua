return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- TypeScript handled by typescript-tools.nvim, not ts_ls

    -- ESLint
    vim.lsp.config.eslint = { capabilities = capabilities }
    vim.lsp.enable("eslint")

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local opts = { buffer = args.buf }

        -- g-prefix (K, gd, gD, gr, [d, ]d handled by lspsaga)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)

        -- Space LSP (rename/code-action via lspsaga for consistent UI)
        vim.keymap.set("n", "<Space>lr", "<cmd>Lspsaga rename<cr>", opts)
        vim.keymap.set("n", "<Space>la", "<cmd>Lspsaga code_action<cr>", opts)
        vim.keymap.set("n", "<Space>lf", function() vim.lsp.buf.format({ async = true }) end, opts)
        vim.keymap.set("n", "<Space>li", "<cmd>LspInfo<cr>", opts)

        -- Space diagnostics
        vim.keymap.set("n", "<Space>ee", function() vim.diagnostic.setqflist() end, opts)
        vim.keymap.set("n", "<Space>el", function() vim.diagnostic.setqflist({ open = true }) end, opts)
        vim.keymap.set("n", "<Space>en", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
        vim.keymap.set("n", "<Space>ep", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
        vim.keymap.set("n", "<Space>ef", vim.diagnostic.open_float, opts)

        -- Which-key groups and g-prefix descriptions
        local wk = require("which-key")
        wk.add({
          { "<Space>l", group = "+LSP" },
          { "<Space>e", group = "+Errors" },
          { "gi", desc = "Go to implementation" },
          { "go", desc = "Go to type definition" },
          { "gL", desc = "Show diagnostics" },
          { "gn", desc = "Search forwards and select" },
          { "gN", desc = "Search backwards and select" },
        })
      end,
    })
  end,
}
