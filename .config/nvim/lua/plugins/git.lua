return {
  {
    "tpope/vim-fugitive",
    keys = {
      { "<Space>gs", "<cmd>Git<cr>", desc = "Git status" },
      { "<Space>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
      { "<Space>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff" },
      { "<Space>gl", "<cmd>Git log<cr>", desc = "Git log" },
      { "<Space>gp", "<cmd>Git push<cr>", desc = "Git push" },
    },
    cmd = { "Git", "G", "Gdiffsplit", "Gvdiffsplit" },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add          = { text = "▎" },
          change       = { text = "▎" },
          delete       = { text = "▁" },
          topdelete    = { text = "▔" },
          changedelete = { text = "▎" },
          untracked    = { text = "┆" },
        },
        signs_staged = {
          add          = { text = "▎" },
          change       = { text = "▎" },
          delete       = { text = "▁" },
          topdelete    = { text = "▔" },
          changedelete = { text = "▎" },
        },
        on_attach = function(bufnr)
          local gs = require("gitsigns")
          local opts = function(desc) return { buffer = bufnr, desc = desc } end

          -- Which-key groups
          require("which-key").add({
            { "<Space>g", group = "+Git" },
            { "<Space>gh", group = "+Hunks" },
            { "<leader>g", group = "+Git hunks" },
          })
          vim.keymap.set("n", "]c", gs.next_hunk, opts("Next hunk"))
          vim.keymap.set("n", "[c", gs.prev_hunk, opts("Prev hunk"))
          vim.keymap.set("n", "<Space>ghr", gs.reset_hunk, opts("Reset hunk"))
          vim.keymap.set("n", "<Space>ghs", gs.stage_hunk, opts("Stage hunk"))
          vim.keymap.set("n", "<Space>gha", gs.stage_hunk, opts("Add hunk"))
          vim.keymap.set("n", "<Space>ghu", gs.undo_stage_hunk, opts("Undo stage hunk"))
          vim.keymap.set("n", "<Space>ghp", gs.preview_hunk, opts("Preview hunk"))
          vim.keymap.set("n", "<Space>ghv", gs.preview_hunk, opts("View hunk"))
          vim.keymap.set("n", "<Space>ghn", gs.next_hunk, opts("Next hunk"))
          vim.keymap.set("n", "<Space>ghN", gs.prev_hunk, opts("Prev hunk"))
        end,
      })
    end,
  },
}
