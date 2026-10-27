return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup({})

      -- Install parsers only if not already installed
      local parsers = {
        "c", "lua", "vim", "vimdoc", "cpp", "javascript", "java", "css",
        "html", "markdown", "latex", "python", "dockerfile",
      }
      local installed = ts.get_installed()
      local to_install = vim.tbl_filter(function(p)
        return not vim.list_contains(installed, p)
      end, parsers)

      if #to_install > 0 then
        ts.install(to_install)
      end
    end,
  },
}
