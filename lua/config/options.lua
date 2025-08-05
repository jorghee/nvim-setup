-- general
vim.o.backup = false
vim.o.errorbells = true
vim.o.swapfile = false
vim.o.mouse = "" -- Disable mouse usage
vim.o.clipboard = "unnamedplus" -- Use the system clipboard
vim.o.showcmd = true -- Show incomplete commands
vim.o.encoding = "utf-8" -- Set the character encoding to UTF-8
vim.o.guicursor = "a:blinkon100" -- cursor blinking

-- numbers
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers
vim.o.numberwidth = 1 -- Set the minimum width for line numbers

-- indentation
vim.o.tabstop = 2 -- Number of the spaces represented by a <Tab>
vim.o.softtabstop = 2 -- Number of spaces that a <Tab> counts for while performing editing operations
vim.o.shiftwidth = 2 -- Number of the spaces for each step (auto)indent
vim.o.expandtab = true -- Converts <Tab>s to spaces

-- Indent for python
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
    vim.bo.expandtab = true
  end,
})
