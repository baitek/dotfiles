-- [[ Keymaps ]]
-- See `:help vim.keymap.set()`

-- Make sure <leader> key always works
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- For saving in vertical edit mode
vim.keymap.set('i', '<C-c>', '<Esc>')

-- Delete selected to void, and then paste from register with preserving it
vim.keymap.set('x', '<leader>p', [["_dP]])

-- Delete to void instead of normal delete
vim.keymap.set({'n', 'v'}, '<leader>d', [["_d]])

-- System copy-paste
vim.keymap.set({'n', 'v'}, '<leader>y', [["+y]])
vim.keymap.set('n', '<leader>Y', [["+Y]])

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Move highlighted text with preserved indentation
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Move half page and center
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')

-- Center next search
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Navigate panes easier
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
