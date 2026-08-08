local o = vim.opt

o.expandtab = true
o.shiftwidth = 2
o.number = true
o.relativenumber = true
o.termguicolors = true
o.signcolumn = "yes"
o.cmdheight = 2
o.cursorline = true
o.scrolloff = 8
o.mouse = 'a'
o.clipboard = "unnamedplus"
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.splitright = true
o.splitbelow = true
o.swapfile = false

vim.diagnostic.config({
  float = { border = 'rounded', source = 'if_many' },
  severity_sort = true,
  virtual_text = { spacing = 2, source = 'if_many' },
})

vim.cmd.colorscheme("tokyonight")
