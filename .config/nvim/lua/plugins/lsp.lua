local servers = { 'lua_ls', 'gopls', 'pyright', 'bashls' }

local server_overrides = {
  lua_ls = {
    settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
        workspace = {
          checkThirdParty = false,
          library = { vim.env.VIMRUNTIME },
        },
      },
    },
  },
}

local function setup_lsp_keymaps()
  local group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true })

  vim.api.nvim_create_autocmd('LspAttach', {
    group = group,
    callback = function(args)
      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = args.buf, desc = desc, silent = true })
      end

      map('n', '<leader>gd', vim.lsp.buf.definition, 'Go to definition')
      map('n', '<leader>gD', vim.lsp.buf.declaration, 'Go to declaration')
      map('n', '<leader>gr', vim.lsp.buf.references, 'Go to references')
      map('n', '<leader>gi', vim.lsp.buf.implementation, 'Go to implementation')
      map('n', '<leader>cs', vim.lsp.buf.document_symbol, 'Document symbols')
      map('n', 'K', vim.lsp.buf.hover, 'Hover documentation')
      map('n', '<leader>cr', vim.lsp.buf.rename, 'Rename symbol')
      map({ 'n', 'x' }, '<leader>ca', vim.lsp.buf.code_action, 'Code action')
      map('n', '[d', function() vim.diagnostic.jump({ count = -1 }) end, 'Previous diagnostic')
      map('n', ']d', function() vim.diagnostic.jump({ count = 1 }) end, 'Next diagnostic')
      map('n', '<leader>ci', '<cmd>checkhealth vim.lsp<CR>', 'LSP information')
    end,
  })
end

return {
  {
    'mason-org/mason-lspconfig.nvim',
    lazy = false,
    dependencies = {
      { 'mason-org/mason.nvim', lazy = false, opts = {} },
      { 'neovim/nvim-lspconfig', lazy = false },
    },
    opts = {
      ensure_installed = servers,
      -- Enable only the explicit list below, not every Mason-installed server.
      automatic_enable = false,
    },
    config = function(_, opts)
      for server, config in pairs(server_overrides) do
        vim.lsp.config(server, config)
      end

      require('mason-lspconfig').setup(opts)
      vim.lsp.enable(servers)
      setup_lsp_keymaps()
    end,
  },
}
