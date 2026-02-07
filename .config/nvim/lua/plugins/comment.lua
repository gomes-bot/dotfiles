return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()

    local api = require("Comment.api")
    vim.keymap.set("n", "<Space>cl", function() api.toggle.linewise.current() end, { desc = "Comment line" })
    vim.keymap.set("v", "<Space>cl", function()
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "nx", false)
      api.toggle.linewise(vim.fn.visualmode())
    end, { desc = "Comment selection" })
  end,
}
