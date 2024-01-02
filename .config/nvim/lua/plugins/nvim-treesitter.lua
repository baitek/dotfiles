return {
  -- Highlight, edit and navigate code
  -- See `:help nvim-treesitter`
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    vim.defer_fn(function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'php', 'go', 'lua', 'python', 'vimdoc', 'vim', 'bash', 'yaml' },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<leader>h',
            node_incremental = '<leader>h'
          }
        }
      }
    end, 0)
  end
}
