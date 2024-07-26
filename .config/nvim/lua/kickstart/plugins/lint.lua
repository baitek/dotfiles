return {

  { -- linting
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        markdown = { 'markdownlint' },
        bash = { 'shellcheck' },
        groovy = { 'npm-groovy-lint' },
        Jenkinsfile = { 'npm-groovy-lint' },
      }

      -- create autocommand which carries out the actual linting on events
      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint()
        end,
      })
      -- command to toggle diagnostics
      vim.api.nvim_create_user_command('DiagnosticsToggle', function()
        local current_value = vim.diagnostic.is_disabled()
        if current_value then
          vim.diagnostic.enable()
        else
          vim.diagnostic.disable()
        end
      end, {})
    end,
  },
}
