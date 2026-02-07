return {
  "ThePrimeagen/harpoon",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "Harpoon add" })
    vim.keymap.set("n", "<leader>hl", require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon list" })
    vim.keymap.set("n", "<leader>h1", function() require("harpoon.ui").nav_file(1) end, { desc = "Harpoon 1" })
    vim.keymap.set("n", "<leader>h2", function() require("harpoon.ui").nav_file(2) end, { desc = "Harpoon 2" })
    vim.keymap.set("n", "<leader>h3", function() require("harpoon.ui").nav_file(3) end, { desc = "Harpoon 3" })
    vim.keymap.set("n", "<leader>h4", function() require("harpoon.ui").nav_file(4) end, { desc = "Harpoon 4" })
  end,
}
