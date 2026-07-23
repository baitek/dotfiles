-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<C-w>h", "<C-w>s", { noremap = true, silent = true, desc = "Split current window horizontally" })
vim.keymap.set({ "n", "i", "v", "c" }, "<C-z>", function()
  vim.cmd('echo "NO"')
end, { noremap = true, silent = false })
