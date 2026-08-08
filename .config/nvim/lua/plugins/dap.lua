local function setup_keymaps(dap, dapui)
  local function map(lhs, rhs, desc)
    vim.keymap.set('n', lhs, rhs, { desc = desc, silent = true })
  end

  map('<leader>db', dap.toggle_breakpoint, 'Debug: Toggle breakpoint')
  map('<leader>du', dapui.toggle, 'Debug: Toggle UI')
end

return {
  {
    'mfussenegger/nvim-dap',
    lazy = false,
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'nvim-neotest/nvim-nio',
      'mason-org/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
    },
    config = function()
      local dap = require('dap')
      local dapui = require('dapui')
      local mason_dap = require('mason-nvim-dap')

      dapui.setup({
        controls = {
          enabled = true,
          element = 'repl',
        },
      })
      mason_dap.setup({
        -- mason-nvim-dap uses the DAP name `python` for the `debugpy` package
        -- and supplies maintained launch configurations through its handlers.
        ensure_installed = { 'python', 'delve', 'bash' },
        handlers = {},
      })

      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end

      setup_keymaps(dap, dapui)
    end,
  },
}
