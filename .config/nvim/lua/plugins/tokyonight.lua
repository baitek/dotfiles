return {
  -- Set tokyonight-night theme
  -- see `:help tokyonight`
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd.colorscheme 'tokyonight-night'
  end
}
