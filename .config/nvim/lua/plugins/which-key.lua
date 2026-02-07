return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({ delay = 200 })
    
    -- Editor-level Space groups (plugin groups registered in their own files)
    wk.add({
      { "<Space>", group = "SPC" },
      { "<Space>f", group = "+Files" },
      { "<Space>b", group = "+Buffers" },
      { "<Space>w", group = "+Windows" },
      { "<Space>s", group = "+Search" },
      { "<Space>q", group = "+Quit" },
      { "<Space>h", group = "+Help" },
      { "<Space>t", group = "+Toggles" },
      { "<leader>h", group = "+Harpoon" },
      { "<leader>x", group = "+Trouble" },
    })
  end,
}
