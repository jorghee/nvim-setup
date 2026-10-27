local opts = { silent = true }

-- Split buffer
vim.keymap.set("n", "<leader>s", "<cmd>vsplit<CR>", { desc = "Vertical split", silent = true })

-- Move between windows of buffers
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", { desc = "Go to left window", silent = true })
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", { desc = "Go to right window", silent = true })

-- Clear search highlight
vim.keymap.set("n", "<esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights", silent = true })

-- Scroll fast (10 lines up/down)
vim.keymap.set("n", "<C-j>", "10<C-e>", { desc = "Scroll 10 lines down", silent = true })
vim.keymap.set("n", "<C-k>", "10<C-y>", { desc = "Scroll 10 lines up", silent = true })
vim.keymap.set("v", "<C-j>", "10<C-e>", { desc = "Scroll 10 lines down", silent = true })
vim.keymap.set("v", "<C-k>", "10<C-y>", { desc = "Scroll 10 lines up", silent = true })

-- File explorer (netrw)
vim.keymap.set("n", "<leader>e", "<cmd>Explore<CR>", { desc = "Open netrw explorer", silent = true })
