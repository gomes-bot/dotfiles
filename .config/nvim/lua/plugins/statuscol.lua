return {
  "luukvbaal/statuscol.nvim",
  config = function()
    local builtin = require("statuscol.builtin")
    require("statuscol").setup({
      relculright = true,
      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        { text = { "%s" }, click = "v:lua.ScSa" },  -- signs (gitsigns, diagnostics)
        { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },  -- line numbers
      },
    })
  end,
}
