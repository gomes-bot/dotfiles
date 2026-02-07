return {
  "neovim/nvim-lspconfig",
  dependencies = { "saghen/blink.cmp" },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    -- TypeScript handled by typescript-tools.nvim, not ts_ls

    -- ESLint
    vim.lsp.config.eslint = { capabilities = capabilities }
    vim.lsp.enable("eslint")

    -- Keymaps on LSP attach (lspsaga overrides some of these)
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local opts = { buffer = args.buf }
        -- K, gd, gD, gr handled by lspsaga
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
        vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
        -- [d, ]d handled by lspsaga
      end,
    })
  end,
}
