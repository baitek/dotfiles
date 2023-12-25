return {
  -- Highlight, edit and navigate code
  -- See `:help nvim-treesitter`
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    -- Defer Treesitter setup after first render to improve startup time of 'nvim {filename}'
    vim.defer_fn(function()
      require('nvim-treesitter.configs').setup {
        -- Add languages to be installed here that you want installed for treesitter
        ensure_installed = { 'php', 'go', 'lua', 'python', 'vimdoc', 'vim', 'bash' },
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

