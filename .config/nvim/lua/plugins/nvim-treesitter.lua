return {
  -- Highlight, edit and navigate code
  -- See `:help nvim-treesitter`
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    vim.defer_fn(function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'go', 'lua', 'python', 'bash', 'yaml', 'starlark' },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true }
      }
    end, 0)
  end
}
