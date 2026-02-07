return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  priority = 100,
  config = function()
    vim.cmd("rshada")
    
    local startify = require("alpha.themes.startify")
    
    startify.section.header.val = {
      "   ██████╗  ██████╗ ███╗   ███╗███████╗███████╗",
      "  ██╔════╝ ██╔═══██╗████╗ ████║██╔════╝██╔════╝",
      "  ██║  ███╗██║   ██║██╔████╔██║█████╗  ███████╗",
      "  ██║   ██║██║   ██║██║╚██╔╝██║██╔══╝  ╚════██║",
      "  ╚██████╔╝╚██████╔╝██║ ╚═╝ ██║███████╗███████║",
      "   ╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝",
    }
    
    -- Override MRU section headers
    startify.mru_opts.ignore = function(path, ext)
      return false
    end
    
    for _, item in ipairs(startify.section.mru_cwd.val) do
      if item.type == "text" then
        item.val = "My most recently used files in the current directory:"
      end
    end
    
    for _, item in ipairs(startify.section.mru.val) do
      if item.type == "text" then
        item.val = "My most recently used files:"
      end
    end
    
    startify.nvim_web_devicons.enabled = true
    
    require("alpha").setup(startify.config)
    
    if vim.fn.argc() == 0 then
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyDone",
        once = true,
        callback = function()
          vim.cmd("rshada")
          require("alpha").start(false)
        end,
      })
    end
  end,
}
