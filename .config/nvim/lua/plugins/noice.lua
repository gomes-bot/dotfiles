return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
      hover = { enabled = true },
      signature = { enabled = true },
      progress = { enabled = true },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      lsp_doc_border = true,
    },
    views = {
      cmdline_popup = {
        position = { row = "40%", col = "50%" },
        size = { width = 60, height = "auto" },
      },
    },
    routes = {
      { filter = { event = "msg_show", kind = "", find = "written" }, opts = { skip = true } },
      { filter = { event = "msg_show", kind = "search_count" }, opts = { skip = true } },
    },
  },
}
