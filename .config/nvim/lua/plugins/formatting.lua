return {
  {
    'stevearc/conform.nvim',
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>cf',
        function()
          require('conform').format({ async = true, lsp_format = 'fallback' })
        end,
        mode = { 'n', 'x' },
        desc = 'Format buffer',
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { 'luafmt' },
        go = { 'gofmt' },
        python = { 'ruff_format' },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
      },
      default_format_opts = {
        lsp_format = 'fallback',
      },
    },
  },
}
