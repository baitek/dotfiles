vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })

-- pasting over a selection no longer clobbers your clipboard
vim.keymap.set({ 'x' }, 'p', function()
  local reg = vim.v.register
  local value = vim.fn.getreg(reg)
  local regtype = vim.fn.getregtype(reg)
  vim.cmd('normal! "' .. reg .. 'p')
  vim.fn.setreg(reg, value, regtype)
  if vim.o.clipboard:match('unnamedplus') and reg == '"' then
    vim.fn.setreg('+', value, regtype)
  end
end, { desc = 'Paste over selection without clobbering the register' })

