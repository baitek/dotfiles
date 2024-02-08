return {
  {
    -- Arbitrary git command in Neovim
    -- See `:help vim-fugitive`
    'tpope/vim-fugitive'
  },
  {
    -- Git signs with actions attributed to them
    -- See `:help gitsigns`
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end
          map('n', '<leader>hp', gs.preview_hunk)
          map('n', '<leader>hr', gs.reset_hunk)
          map('v', '<leader>hr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
          map('n', '<leader>hR', gs.reset_buffer)
          map('n', '<leader>hb', gs.toggle_current_line_blame)
          map('n', '<leader>hd', gs.diffthis)
        end
      }
    end
  }
}
