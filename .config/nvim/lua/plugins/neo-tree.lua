return {
  -- File tree panel on the side
  -- See `:help neo-tree`
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'MunifTanjim/nui.nvim'
  },
  config = function()
    require('neo-tree').setup {
      close_if_last_window = true,
      filesystem = {
        filtered_items = {
          visible = true
        }
      }
    }
    vim.keymap.set('n', '<C-n>', ':Neotree toggle current reveal_force_cwd left<CR>')
  end
}
