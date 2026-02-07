-- ============================================
-- SPACE LEADER KEYMAPS (SpaceVim style)
-- ============================================

-- [f] +Files
vim.keymap.set("n", "<Space>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<Space>fr", "<cmd>Telescope oldfiles only_cwd=true<cr>", { desc = "Recent files" })
vim.keymap.set("n", "<Space>fs", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<Space>fS", "<cmd>wa<cr>", { desc = "Save all files" })
vim.keymap.set("n", "<Space>fo", function() if vim.fn.expand("%") == "" then vim.cmd("Neotree reveal") else vim.cmd("Neotree reveal") end end, { desc = "Open file tree" })
vim.keymap.set("n", "<Space>ft", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<Space>fT", "<cmd>Neotree<cr>", { desc = "Show file tree" })
vim.keymap.set("n", "<Space>fy", "<cmd>let @+ = expand('%:p')<cr>", { desc = "Yank file path" })

-- [b] +Buffers
vim.keymap.set("n", "<Space>bb", "<cmd>Telescope buffers<cr>", { desc = "List buffers" })
vim.keymap.set("n", "<Space>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<Space>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<Space>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<Space>bh", "<cmd>Alpha<cr>", { desc = "Home screen" })
vim.keymap.set("n", "<Space><Tab>", "<cmd>b#<cr>", { desc = "Last buffer" })

-- [w] +Windows
vim.keymap.set("n", "<Space>wv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
vim.keymap.set("n", "<Space>ws", "<cmd>split<cr>", { desc = "Horizontal split" })
vim.keymap.set("n", "<Space>wd", "<cmd>close<cr>", { desc = "Close window" })
vim.keymap.set("n", "<Space>wh", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<Space>wj", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<Space>wk", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<Space>wl", "<C-w>l", { desc = "Window right" })
vim.keymap.set("n", "<Space>w=", "<C-w>=", { desc = "Balance windows" })
vim.keymap.set("n", "<Space>1", "1<C-w>w", { desc = "Window 1" })
vim.keymap.set("n", "<Space>2", "2<C-w>w", { desc = "Window 2" })
vim.keymap.set("n", "<Space>3", "3<C-w>w", { desc = "Window 3" })
vim.keymap.set("n", "<Space>4", "4<C-w>w", { desc = "Window 4" })

-- [g] +VCS/git
vim.keymap.set("n", "<Space>gs", "<cmd>Git<cr>", { desc = "Git status" })
vim.keymap.set("n", "<Space>gb", "<cmd>Git blame<cr>", { desc = "Git blame" })
vim.keymap.set("n", "<Space>gd", "<cmd>Gdiffsplit<cr>", { desc = "Git diff" })
vim.keymap.set("n", "<Space>gl", "<cmd>Git log<cr>", { desc = "Git log" })
vim.keymap.set("n", "<Space>gp", "<cmd>Git push<cr>", { desc = "Git push" })

-- [s] +Search
vim.keymap.set("n", "<Space>ss", "<cmd>Telescope live_grep<cr>", { desc = "Search in project" })
vim.keymap.set("n", "<Space>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search buffer" })
vim.keymap.set("n", "<Space>sh", "<cmd>Telescope help_tags<cr>", { desc = "Search help" })
vim.keymap.set("n", "<Space>sm", "<cmd>Telescope marks<cr>", { desc = "Search marks" })
vim.keymap.set("n", "<Space>sr", "<cmd>Telescope registers<cr>", { desc = "Search registers" })

-- [p] +Projects
vim.keymap.set("n", "<Space>pf", "<cmd>Telescope find_files<cr>", { desc = "Find file in project" })
vim.keymap.set("n", "<Space>ps", "<cmd>Telescope live_grep<cr>", { desc = "Search in project" })
vim.keymap.set("n", "<Space>pb", "<cmd>Telescope buffers<cr>", { desc = "Project buffers" })

-- [q] +Quit
vim.keymap.set("n", "<Space>qq", "<cmd>qa<cr>", { desc = "Quit all" })
vim.keymap.set("n", "<Space>qQ", "<cmd>qa!<cr>", { desc = "Quit without saving" })
vim.keymap.set("n", "<Space>qs", "<cmd>wqa<cr>", { desc = "Save and quit" })

-- [h] +Help
vim.keymap.set("n", "<Space>hh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
vim.keymap.set("n", "<Space>hk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
vim.keymap.set("n", "<Space>hm", "<cmd>Telescope man_pages<cr>", { desc = "Man pages" })

-- [t] +Toggles
vim.keymap.set("n", "<Space>tn", "<cmd>set number!<cr>", { desc = "Toggle line numbers" })
vim.keymap.set("n", "<Space>tr", "<cmd>set relativenumber!<cr>", { desc = "Toggle relative numbers" })
vim.keymap.set("n", "<Space>tw", "<cmd>set wrap!<cr>", { desc = "Toggle wrap" })
vim.keymap.set("n", "<Space>th", "<cmd>set hlsearch!<cr>", { desc = "Toggle highlight" })

-- [e] +Errors (Trouble)
vim.keymap.set("n", "<Space>ee", "<cmd>lua vim.diagnostic.setqflist()<cr><cmd>copen<cr>", { desc = "All diagnostics" })
vim.keymap.set("n", "<Space>eb", "<cmd>lua vim.diagnostic.setqflist({open = true})<cr>", { desc = "Buffer diagnostics" })

-- [l] +LSP
vim.keymap.set("n", "<Space>lr", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "<Space>la", vim.lsp.buf.code_action, { desc = "Code action" })
vim.keymap.set("n", "<Space>lf", function() vim.lsp.buf.format({ async = true }) end, { desc = "Format" })
vim.keymap.set("n", "<Space>li", "<cmd>LspInfo<cr>", { desc = "LSP info" })

-- ============================================
-- COMMA LEADER (custom)
-- ============================================
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle NERDTree" })
vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus NERDTree" })

-- ============================================
-- Ctrl+hjkl to navigate windows
-- ============================================
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- ============================================
-- Comma + f fuzzy find group (SpaceVim style)
-- ============================================
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "Find references" })
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find outline" })
vim.keymap.set("n", "<leader>fj", "<cmd>Telescope jumplist<cr>", { desc = "Find jumplist" })
vim.keymap.set("n", "<leader>fl", "<cmd>Telescope loclist<cr>", { desc = "Find loclist" })
vim.keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "Find quickfix" })
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope messages<cr>", { desc = "Find messages" })
vim.keymap.set("n", "<leader>fe", "<cmd>Telescope registers<cr>", { desc = "Find registers" })
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })

-- Ctrl+P for find files
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })

-- Which-key descriptions for g prefix
local wk = require("which-key")
wk.add({
  { "gd", desc = "Go to definition" },
  { "gD", desc = "Go to declaration" },
  { "gi", desc = "Go to implementation" },
  { "gr", desc = "Go to references" },
  { "gL", desc = "Show diagnostics" },
  { "go", desc = "Go to type definition" },
  { "gn", desc = "Search forwards and select" },
  { "gN", desc = "Search backwards and select" },
})


-- [e] +Errors additional bindings
vim.keymap.set("n", "<Space>en", vim.diagnostic.goto_next, { desc = "Next error" })
vim.keymap.set("n", "<Space>ep", vim.diagnostic.goto_prev, { desc = "Previous error" })
vim.keymap.set("n", "<Space>el", "<cmd>lua vim.diagnostic.setqflist({open = true})<cr>", { desc = "List errors" })
vim.keymap.set("n", "<Space>ef", vim.diagnostic.open_float, { desc = "Error float" })
