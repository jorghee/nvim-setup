return {
  "ravitemer/mcphub.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  build = "npm install -g mcp-hub@latest",
  config = function()
    require("mcphub").setup({
      shutdown_delay = 5 * 60 * 1000, -- 5 minutes
      mcp_request_timeout = 5 * 60 * 1000, -- 5 minutes
      json_decode = function(s) return require("json5").parse(s) end,

      on_ready = function(hub)
          -- Called when hub is ready
      end,
      on_error = function(err)
          -- Called on errors
      end,

      global_env = {},
    })
  end,
}
