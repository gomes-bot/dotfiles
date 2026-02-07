return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.setup({ delay = 200 })
    
    -- Register Space groups (SpaceVim style)
    wk.add({
      { "<Space>", group = "SPC" },
      { "<Space>f", group = "+Files" },
      { "<Space>b", group = "+Buffers" },
      { "<Space>w", group = "+Windows" },
      { "<Space>g", group = "+VCS/git" },
      { "<Space>s", group = "+Search" },
      { "<Space>p", group = "+Projects" },
      { "<Space>q", group = "+Quit" },
      { "<Space>h", group = "+Help" },
      { "<Space>t", group = "+Toggles" },
      { "<Space>e", group = "+Errors" },
      { "<Space>l", group = "+LSP" },
      -- Comma groups  
      { "<leader>h", group = "+Harpoon" },
      { "<leader>x", group = "+Trouble" },
      { "<leader>g", group = "+Git" },
    })
  end,
}
