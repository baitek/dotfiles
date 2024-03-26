return {
  -- LSP Configuration & Plugins
  -- See `:help lspconfig`
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for Neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    { 'j-hui/fidget.nvim', opts = {} }, -- `opts = {}` is the same as calling `require('fidget').setup({})`

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim'
  },
  config = function()
    require('mason').setup({
      ensure_installed = {
        'black',
        'buildifier',
        'shellcheck',
        'prettierd'
      }
    })
    require('mason-lspconfig').setup({
      ensure_installed = {
        'lua_ls',
        'gopls',
        'bashls',
        'pyright',
        'bzl',
        'yamlls',
        'tsserver'
      }
    })
    require('neodev').setup()

    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require('lspconfig')
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          completion = {
            callSnippet = "Replace"
          }
        }
      },
      capabilities = capabilities
    })
    lspconfig.gopls.setup({
      capabilities = capabilities
    })
    lspconfig.bashls.setup({
      capabilities = capabilities
    })
    lspconfig.pyright.setup({
      capabilities = capabilities
    })
    lspconfig.bzl.setup({
      capabilities = capabilities
    })
    lspconfig.yamlls.setup({
      capabilities = capabilities
    })
    lspconfig.tsserver.setup({
      capabilities = capabilities
    })
    lspconfig.groovyls.setup({
      capabilities = capabilities
    })

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
          vim.lsp.buf.format { async = true }
        end, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', '<leader>K', vim.lsp.buf.signature_help, opts)
      end,
    })
  end
}
