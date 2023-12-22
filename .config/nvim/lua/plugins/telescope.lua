return {
  -- Fuzzy Finder (files, lsp, etc)
  -- See `:help telescope` and `:help telescope.setup()`
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      -- Fuzzy Finder Algorithm which requires local dependencies to be built
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end
    },
    'nvim-telescope/telescope-ui-select.nvim'
  },
  config = function()
    require('telescope').setup {
      -- Disable <C-u> and <C-d> as it is used in VIM for scrolling up/down
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false
          }
        }
      },
      -- Find/search hidden files
      pickers = {
        live_grep = {
          additional_args = function()
            return { "--hidden" }
          end
        },
        find_files = {
          hidden = true
        }
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown{}
        }
      }
    }
    -- Enable telescope extensions
    pcall(require('telescope').load_extension 'fzf')
    require('telescope').load_extension('ui-select')

    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Find files' })
    vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep, { desc = 'Search in workspace with grep' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search for help' })
  end
}
