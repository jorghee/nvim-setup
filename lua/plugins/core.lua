return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    config = function()
      local ts = require("nvim-treesitter")
      ts.setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
          -- disable = { "html", "latex" },
        },
      })

      ts.install({
        "c", "lua", "vim", "cpp", "javascript", "java", "css", "html", "markdown", "latex", "python"
      })
    end,
  }
}
