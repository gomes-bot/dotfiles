return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        numbers = "ordinal",
        separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = "nvim_lsp",
      },
    })
    -- Tab/Shift-Tab to cycle
    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<cr>")
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>")
    -- Leader + number to jump to buffer (like SpaceVim)
    vim.keymap.set("n", "<leader>1", "<cmd>BufferLineGoToBuffer 1<cr>", { desc = "Buffer 1" })
    vim.keymap.set("n", "<leader>2", "<cmd>BufferLineGoToBuffer 2<cr>", { desc = "Buffer 2" })
    vim.keymap.set("n", "<leader>3", "<cmd>BufferLineGoToBuffer 3<cr>", { desc = "Buffer 3" })
    vim.keymap.set("n", "<leader>4", "<cmd>BufferLineGoToBuffer 4<cr>", { desc = "Buffer 4" })
    vim.keymap.set("n", "<leader>5", "<cmd>BufferLineGoToBuffer 5<cr>", { desc = "Buffer 5" })
    vim.keymap.set("n", "<leader>6", "<cmd>BufferLineGoToBuffer 6<cr>", { desc = "Buffer 6" })
    vim.keymap.set("n", "<leader>7", "<cmd>BufferLineGoToBuffer 7<cr>", { desc = "Buffer 7" })
    vim.keymap.set("n", "<leader>8", "<cmd>BufferLineGoToBuffer 8<cr>", { desc = "Buffer 8" })
    vim.keymap.set("n", "<leader>9", "<cmd>BufferLineGoToBuffer 9<cr>", { desc = "Buffer 9" })
  end,
}
