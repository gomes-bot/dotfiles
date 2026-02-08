return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  config = function()
    local telescope = require("telescope")
    telescope.setup({
      defaults = {
        layout_config = {
          horizontal = { width = 0.9 }
        },
        path_display = { "smart" },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({})
        },
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
        },
      },
    })
    telescope.load_extension("ui-select")
    telescope.load_extension("file_browser")

    vim.api.nvim_create_user_command("Rg", function(opts)
      if opts.args ~= "" then
        require("telescope.builtin").grep_string({ search = opts.args })
      else
        require("telescope.builtin").live_grep()
      end
    end, { nargs = "?", desc = "Ripgrep search" })
  end,
}
