-- Ctrl+P to find files
vim.keymap.set("n", "<C-p>", "<cmd>Telescope find_files<cr>", { desc = "Find files" })

-- Window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Window left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Window down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Window up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Window right" })

-- Neo-tree
vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })
vim.keymap.set("n", "<leader>o", "<cmd>Neotree focus<cr>", { desc = "Focus Neo-tree" })

-- Telescope (comma-leader find group)
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope lsp_references<cr>", { desc = "Find references" })
vim.keymap.set("n", "<leader>fo", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find outline" })
vim.keymap.set("n", "<leader>fj", "<cmd>Telescope jumplist<cr>", { desc = "Find jumplist" })
vim.keymap.set("n", "<leader>fl", "<cmd>Telescope loclist<cr>", { desc = "Find loclist" })
vim.keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", { desc = "Find quickfix" })
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope messages<cr>", { desc = "Find messages" })
vim.keymap.set("n", "<leader>fe", "<cmd>Telescope registers<cr>", { desc = "Find registers" })
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })

-- Close window
vim.keymap.set("n", "q", "<cmd>close<cr>", { desc = "Close window" })
