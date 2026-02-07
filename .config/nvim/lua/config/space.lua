-- Files
vim.keymap.set("n", "<Space>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
vim.keymap.set("n", "<Space>fr", "<cmd>Telescope oldfiles only_cwd=true<cr>", { desc = "Recent files" })
vim.keymap.set("n", "<Space>fs", "<cmd>w<cr>", { desc = "Save file" })
vim.keymap.set("n", "<Space>fS", "<cmd>wa<cr>", { desc = "Save all files" })
vim.keymap.set("n", "<Space>fo", "<cmd>Neotree reveal<cr>", { desc = "Open file tree" })
vim.keymap.set("n", "<Space>ft", "<cmd>Neotree toggle<cr>", { desc = "Toggle file tree" })
vim.keymap.set("n", "<Space>fT", "<cmd>Neotree<cr>", { desc = "Show file tree" })
vim.keymap.set("n", "<Space>fy", function() vim.fn.setreg("+", vim.fn.expand("%:p")) end, { desc = "Yank file path" })

-- Buffers
vim.keymap.set("n", "<Space>bb", "<cmd>Telescope buffers<cr>", { desc = "List buffers" })
vim.keymap.set("n", "<Space>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer" })
vim.keymap.set("n", "<Space>bn", "<cmd>bnext<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "<Space>bp", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<Space>bh", "<cmd>Alpha<cr>", { desc = "Home screen" })
vim.keymap.set("n", "<Space><Tab>", "<cmd>b#<cr>", { desc = "Last buffer" })

-- Windows
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

-- Search
vim.keymap.set("n", "<Space>ss", "<cmd>Telescope live_grep<cr>", { desc = "Search in project" })
vim.keymap.set("n", "<Space>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", { desc = "Search buffer" })
vim.keymap.set("n", "<Space>sh", "<cmd>Telescope help_tags<cr>", { desc = "Search help" })
vim.keymap.set("n", "<Space>sm", "<cmd>Telescope marks<cr>", { desc = "Search marks" })
vim.keymap.set("n", "<Space>sr", "<cmd>Telescope registers<cr>", { desc = "Search registers" })

-- Quit
vim.keymap.set("n", "<Space>qq", "<cmd>qa<cr>", { desc = "Quit all" })
vim.keymap.set("n", "<Space>qQ", "<cmd>qa!<cr>", { desc = "Quit without saving" })
vim.keymap.set("n", "<Space>qs", "<cmd>wqa<cr>", { desc = "Save and quit" })

-- Help
vim.keymap.set("n", "<Space>hh", "<cmd>Telescope help_tags<cr>", { desc = "Help tags" })
vim.keymap.set("n", "<Space>hk", "<cmd>Telescope keymaps<cr>", { desc = "Keymaps" })
vim.keymap.set("n", "<Space>hm", "<cmd>Telescope man_pages<cr>", { desc = "Man pages" })

-- Toggles
vim.keymap.set("n", "<Space>tn", function() vim.opt.number = not vim.opt.number:get() end, { desc = "Toggle line numbers" })
vim.keymap.set("n", "<Space>tr", function() vim.opt.relativenumber = not vim.opt.relativenumber:get() end, { desc = "Toggle relative numbers" })
vim.keymap.set("n", "<Space>tw", function() vim.opt.wrap = not vim.opt.wrap:get() end, { desc = "Toggle wrap" })
vim.keymap.set("n", "<Space>th", function() vim.opt.hlsearch = not vim.opt.hlsearch:get() end, { desc = "Toggle highlight" })
