return {
  {
    "AlexvZyl/nordic.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      -- load the colorscheme here
      vim.cmd.colorscheme "nordic"
    end,
  },
  {
    -- Adding catppuccin as well, but disabled.
    -- To use it, comment out the "nordic.nvim" block above and uncomment this one.
    -- Then change the `vim.cmd.colorscheme` line below.
    "catppuccin/nvim",
    as = "catppuccin",
    lazy = false,
    priority = 1000,
    enabled = false, -- Set to true to use this theme
    config = function()
      -- vim.cmd.colorscheme "catppuccin"
    end
  }
}
