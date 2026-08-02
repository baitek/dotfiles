return {
  {
    'folke/which-key.nvim',
    lazy = false,
    config = true,
  },
  {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require("bufferline").setup({})
      vim.keymap.set({ 'n', 'x' }, '<S-l>', '<cmd>BufferLineCycleNext<CR>', { desc = 'Next buffer' })
      vim.keymap.set({ 'n', 'x' }, '<S-h>', '<cmd>BufferLineCyclePrev<CR>', { desc = 'Previous buffer' })
      vim.keymap.set('n', '<leader>bd', '<cmd>BufferLineClose<CR>', { desc = 'Close buffer' })
      vim.keymap.set('n', '<leader>bo', '<cmd>BufferLineCloseOthers<CR>', { desc = 'Close other buffers' })
    end,
  }
}
