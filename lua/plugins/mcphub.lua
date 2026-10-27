return {
  "ravitemer/mcphub.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  build = "bundled_build.lua",
  cmd = "MCPHub",
  event = "VeryLazy",
  config = function()
    require("mcphub").setup({
      use_bundled_binary = true,
      shutdown_delay = 5 * 60 * 1000, -- 5 minutes
      mcp_request_timeout = 5 * 60 * 1000, -- 5 minutes
      json_decode = vim.json.decode,
    })
  end,
}
