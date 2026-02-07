return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup()
    
    -- SpaceVim style: Space c l to toggle comment
    vim.keymap.set("n", "<Space>cl", "<cmd>lua require(\"Comment.api\").toggle.linewise.current()<cr>", { desc = "Comment line" })
    vim.keymap.set("v", "<Space>cl", "<esc><cmd>lua require(\"Comment.api\").toggle.linewise(vim.fn.visualmode())<cr>", { desc = "Comment selection" })
  end,
}
