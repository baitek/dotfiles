vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- move highlighted text
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append line below without moving cursor
vim.keymap.set("n", "J", "mzJ`z")

-- move half page and center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- center next search
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- paste without losing current yank (use when pasting to selected text)
vim.keymap.set("x", "<leader>p", "\"_dP")

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- cut to system clipboard
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- save changes after making changes in vertical edit mode
vim.keymap.set("i", "<C-c>", "<Esc")

-- unbind Q
vim.keymap.set("n", "Q", "<nop>")

-- jump between projects (#todo comeback here when more knowledgable about tmux)
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- format code
vim.keymap.set("n", "<leader>f", function()
    vim.lsp.buf.format()
end)

-- navigate quick fix list
-- vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-N>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>;", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>,", "<cmd>lprev<CR>zz")

-- replace the word that you are on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- chmod +x current file
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

