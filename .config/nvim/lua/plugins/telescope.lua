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
  end,
}
