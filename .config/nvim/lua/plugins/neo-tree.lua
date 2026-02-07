return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = false,
  opts = {
    window = {
      position = "right",
      width = 35,
      mappings = {
        ["h"] = "close_node",
        ["l"] = "open",
        ["<cr>"] = "open",
        ["s"] = "open_split",
        ["v"] = "open_vsplit",
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      filtered_items = {
        hide_dotfiles = false,
        hide_hidden = false,
        hide_gitignored = false,
      },
      hijack_netrw_behavior = "open_current",
    },
    event_handlers = {
      {
        event = "vim_buffer_enter",
        handler = function()
          if vim.bo.filetype == "neo-tree" then
            vim.cmd("setlocal relativenumber")
          end
        end,
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    
    -- Auto-open neo-tree when opening a directory or file
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function(data)
        local is_directory = vim.fn.isdirectory(data.file) == 1
        local is_file = vim.fn.filereadable(data.file) == 1
        if is_directory then
          vim.cmd("Neotree show dir=" .. data.file)
        elseif is_file or vim.fn.argc() > 0 then
          vim.cmd("Neotree show reveal")
        end
      end,
    })
  end,
}
