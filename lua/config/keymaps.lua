local opts = { noremap = true, silent = true }

-- split buffer
vim.keymap.set("n", "<leader>s", ":vsplit<CR>", opts)

-- Move between windows of buffers
vim.keymap.set("n", "<C-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<C-l>", ":wincmd l<CR>", opts)

-- Clear search highlight
vim.keymap.set("n", "<esc>", ":noh<return><esc>", opts)

-- scroll fast
vim.keymap.set("n", "<C-j>", "10<C-e>", opts)
vim.keymap.set("n", "<C-k>", "10<C-y>", opts)
vim.keymap.set("v", "<C-j>", "10<C-e>", opts)
vim.keymap.set("v", "<C-k>", "10<C-y>", opts)

-- nvim Explore (using netrw)
vim.keymap.set("n", "<leader>e", ":Explore<CR>", opts)
