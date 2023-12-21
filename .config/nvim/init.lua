-- Set <space> as the leader key
-- See `:help mapleader`
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- [[ Install `lazy.nvim` plugin manager ]]
-- `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Configure plugins ]]
require('lazy').setup('plugins')

-- [[ Setting options ]]
-- See `:help vim.o`
vim.o.hlsearch = false                 -- set highlight on search
vim.wo.number = true                   -- make line numbers default
vim.o.relativenumber = true            -- enable relative numbers by default
vim.o.mouse = 'a'                      -- enable mouse mode
vim.o.clipboard = 'unnamedplus'        -- sync clipboard between OS and Neovim (see `:help 'clipboard'`)
vim.o.breakindent = true               -- enable break indent
vim.o.undofile = true                  -- save undo history
vim.o.swapfile = false                 -- disable swap file by default
vim.o.backup = false                   -- disable backup file by default
vim.o.ignorecase = true                -- case-insensitive searching UNLESS \C
vim.o.smartcase = true                 -- /\ or capital in search
vim.wo.signcolumn = 'yes'              -- keep signcolumn on by default
vim.o.updatetime = 250                 -- decrease update time
vim.o.timeoutlen = 500                 -- timeout for sequence
vim.o.completeopt = 'menuone,noselect' -- set completeopt to have a better completion experience
vim.o.termguicolors = true             -- NOTE: you should make sure your terminal supports this

-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`

-- Make sure <leader> key always works
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Move highlighted text with preserved indentation
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Jump between files
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move half page and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Center next search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
