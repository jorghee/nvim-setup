return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      { 'williamboman/mason.nvim' },
      { 'williamboman/mason-lspconfig.nvim' },

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-nvim-lua' },

      -- Snippets
      { 'L3MON4D3/LuaSnip' },
      { 'rafamadriz/friendly-snippets' },
    },
    config = function()

      local lsp_zero = require('lsp-zero')
      lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions
        lsp_zero.default_keymaps({ buffer = bufnr })

        local opts = { buffer = bufnr, remap = false }
        vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts) --show information in a floating window
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts) --show diagnostics in a floating window
        vim.keymap.set("n", "<leader>n", vim.diagnostic.goto_next, opts) --move to the next diagnostic
        vim.keymap.set("n", "<leader>m", vim.diagnostic.goto_prev, opts) --move to the previous diagnostic
        vim.keymap.set("n", "<leader>vrc", vim.lsp.buf.code_action, opts) --select an action available from lsp
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts) --Lists the references in the quickfix window
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts) --rename all references
        vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, opts) --show documentation in a floating window
      end)

      require('mason').setup({})
      require('mason-lspconfig').setup({
        ensure_installed = {
          'lua_ls',
          'clangd',
          'jdtls',
          'cssls',
          'html',
          'eslint',
          'ltex',
          'pylsp',
        },
        handlers = {
          lsp_zero.default_setup,
        },
      })

      lsp_zero.set_sign_icons({
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»',
      })

      -- Autocompletion config
      local cmp = require('cmp')
      local cmp_action = require('lsp-zero').cmp_action()
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'nvim_lua' },
          { name = 'luasnip' },
        },
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = false }),
          ["<Tab>"] = cmp_action.luasnip_supertab(),
          ["<S-Tab>"] = cmp_action.luasnip_shift_supertab(),
        }),
        preselect = cmp.PreselectMode.Item,
        completion = {
          completeopt = 'menu,menuone,noinsert'
        },
        formatting = {
          fields = { 'menu', 'abbr', 'kind' },
          format = function(entry, item)
            local menu_icon = {
              nvim_lsp = 'λ',
              luasnip = '⋗',
              buffer = 'Ω',
              path = '󰴠 ',
              nvim_lua = 'Π',
            }
            item.menu = menu_icon[entry.source.name]
            return item
          end,
        }
      })

      -- Diagnostic config
      vim.diagnostic.config({
        virtual_text = false,
        severity_sort = false,
        underline = true,
        update_in_insert = false,
        float = {
          source = "always",
        }
      })
    end,
  },
}
