return {
  {
    'stevearc/oil.nvim',
    opts = {
      view_options = { show_hidden = true },
      keymaps = { ['<C-h>'] = false },
    },
    keys = { { '<leader>e', '<cmd>Oil<cr>', desc = 'File Browser' } },
  },
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      picker = { enabled = true },
      notifier = { enabled = true },
      input = { enabled = true },
    },
    keys = {
      { '<leader>sf', function() Snacks.picker.files({ hidden = true }) end, desc = 'Find Files' },
      { '<leader>ss', function() Snacks.picker.grep({ hidden = true }) end, desc = 'Search Text' },
      { '<leader>sr', function() Snacks.picker.recent() end, desc = 'Recent Files' },
      { '<leader>sk', function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { '<leader>sb', function() Snacks.picker.buffers() end, desc = 'Buffers' }
    },
  },
  {
    'paulbkim-dev/vim-herdr-navigation',
    lazy = false,
    config = function(plugin)
      dofile(plugin.dir .. '/editor/nvim.lua')
    end,
  },
}
