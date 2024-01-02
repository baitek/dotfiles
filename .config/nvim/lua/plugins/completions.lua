return {
  {
    -- Get completion candidates from LSPs to nvim-cmp
    -- See `cmp-nvim-lsp`
    'hrsh7th/cmp-nvim-lsp',
  },
  {
    -- Snippet engine
    -- See `:help LuaSnip`
    'L3MON4D3/LuaSnip',
    dependencies = {
      -- Completion source for nvim-cmp
      -- See `:help cmp_luasnip`
      'saadparwaiz1/cmp_luasnip',
      -- Snippets collection for a set of different programming languages
      -- See `:help friendly-snippets`
      'rafamadriz/friendly-snippets'
    }
  },
  {
    -- A completion engine plugin
    -- See `:help nvim-cmp`
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require 'cmp'
      require('luasnip.loaders.from_vscode').lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered()
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true })
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }
        }, {
          { name = 'buffer' }
        })
      })
    end
  }
}
