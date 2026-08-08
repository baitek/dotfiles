return {
  {
    'nickjvandyke/opencode.nvim',
    version = '*',
    config = function()
      vim.g.opencode_opts = {}

      vim.keymap.set({ 'n', 'x' }, '<leader>l', function()
        local operator = require('opencode').operator('@this ')
        return vim.fn.mode() == 'n' and operator .. '_' or operator
      end, { desc = 'Append line or range to OpenCode', expr = true })
    end,
  },
}
