return {
  "goolord/alpha-nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local startify = require("alpha.themes.startify")

    startify.section.header.val = {
      [[   ██████╗  ██████╗ ███╗   ███╗███████╗███████╗]],
      [[  ██╔════╝ ██╔═══██╗████╗ ████║██╔════╝██╔════╝]],
      [[  ██║  ███╗██║   ██║██╔████╔██║█████╗  ███████╗]],
      [[  ██║   ██║██║   ██║██║╚██╔╝██║██╔══╝  ╚════██║]],
      [[  ╚██████╔╝╚██████╔╝██║ ╚═╝ ██║███████╗███████║]],
      [[   ╚═════╝  ╚═════╝ ╚═╝     ╚═╝╚══════╝╚══════╝]],
    }

    -- Filter out node_modules and gitignored files
    startify.mru_opts.ignore = function(path, ext)
      if path:match("node_modules") then return true end
      if path:match("%.git/") then return true end
      if path:match("dist/") then return true end
      if path:match("build/") then return true end
      if path:match("%.lock$") then return true end
      if path:match("package%-lock%.json$") then return true end
      if path:match("yarn%.lock$") then return true end
      
      local cwd = vim.fn.getcwd()
      if vim.fn.isdirectory(cwd .. "/.git") == 1 then
        local result = vim.fn.system("git -C " .. vim.fn.shellescape(cwd) .. " check-ignore -q " .. vim.fn.shellescape(path) .. " 2>/dev/null; echo $?")
        if vim.trim(result) == "0" then
          return true
        end
      end
      
      return false
    end

    vim.cmd("rshada")
    alpha.setup(startify.config)
  end,
}
