return {
  {
    -- Source for nvim-cmp's LSP suggestions
    -- See `:help cmp-nvim-lsp`
    'hrsh7th/cmp-nvim-lsp',
  },
  {
    -- Source for buffer words
    -- See `:help cmp-buffer`
    'hrsh7th/cmp-buffer',
  },
  {
    -- Source for filesystem paths
    -- See `:help cmp-path`
    'hrsh7th/cmp-path',
  },
  {
    -- Source for VIM's cmdline (requires cmp-buffer to work)
    -- See `:help cmp-cmdline`
    'hrsh7th/cmp-cmdline',
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
      local luasnip = require 'luasnip'
      require('luasnip.loaders.from_vscode').lazy_load()

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      cmp.setup({
        completion = {
          autocomplete = false
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered()
        },
        mapping = cmp.mapping.preset.insert({
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
          }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' }
        }, {
          { name = 'buffer' }
        })
      })

      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = 'path' }
        }, {
          { name = 'cmdline' }
        })
      })
    end
  }
}
