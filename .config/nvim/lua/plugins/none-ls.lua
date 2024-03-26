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
      null_ls.builtins.diagnostics.buildifier,
      null_ls.builtins.diagnostics.npm_groovy_lint.with({
        filetypes = { 'groovy', 'Jenkinsfile' }
      }),
      null_ls.builtins.formatting.buildifier,
      null_ls.builtins.formatting.black,
      null_ls.builtins.formatting.prettierd,
      null_ls.builtins.formatting.shfmt,
      null_ls.builtins.formatting.npm_groovy_lint.with({
        filetypes = { 'groovy', 'Jenkinsfile' }
      }),

    }

    null_ls.setup({ sources = sources })
  end
}
