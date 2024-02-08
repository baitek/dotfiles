return {
  -- Fuzzy Finder (files, lsp, etc)
  -- See `:help telescope` and `:help telescope.setup()`
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      -- Fuzzy Finder Algorithm which requires local dependencies to be built
      -- See `:help telescope-fzf-native.nvim`
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
          require("telescope.themes").get_dropdown {}
        }
      }
    }
    -- Enable telescope extensions
    pcall(require('telescope').load_extension 'fzf')
    require('telescope').load_extension('ui-select')

    -- See `:help telescope.builtin`
    vim.keymap.set('n', '<leader>sb', require('telescope.builtin').buffers, { desc = 'Search opened buffers' })
    vim.keymap.set('n', '<leader>so', require('telescope.builtin').oldfiles, { desc = 'Search recently opened files' })
    vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Search file names' })

    vim.keymap.set('n', '<leader>/', function()
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
        layout_config = {
          width = 0.9,
        },
      })
    end, { desc = 'Fuzzily search in current buffer' })
    vim.keymap.set('n', '<leader>sp', require('telescope.builtin').live_grep, { desc = 'Search phrase in workspace' })
    vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search for help' })
  end
}
