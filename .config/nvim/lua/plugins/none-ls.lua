return {
  -- Inject LSP diagnostics, code actions and more
  -- See `:help none-ls`
  'nvimtools/none-ls.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local null_ls = require("null-ls")

    -- register any number of sources simultaneously
    local sources = {
      null_ls.builtins.formatting.prettier.with({
        filetypes = { 'json', 'markdown', 'yaml', 'html', 'css' }
      }),
      null_ls.builtins.formatting.black.with({
        filetypes = { 'python' }
      }),
      null_ls.builtins.formatting.beautysh
    }

    null_ls.setup({ sources = sources })
  end
}
