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
      { '<leader>f', function() Snacks.picker.files({ hidden = true }) end, desc = 'Find Files' },
      { '<leader>s', function() Snacks.picker.grep() end,  desc = 'Search Text' },
      { '<leader>k', function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { '<leader>b', function() Snacks.picker.buffers() end, desc = 'Buffers' },
      { 'gd', function() Snacks.picker.lsp_definitions() end, desc = 'Goto Definition' },
    },
  },
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>",  desc = "Tmux Navigate Left" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>",  desc = "Tmux Navigate Down" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>",    desc = "Tmux Navigate Up" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>", desc = "Tmux Navigate Right" },
    },
  },
}
