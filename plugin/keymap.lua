vim.keymap.set("n", "<C-a>", function()
	vim.cmd("normal! ggVG", false)
end, { desc = "Select [A]ll" })

vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })

vim.keymap.set("t", "<C-h>", [[<C-\><C-n><C-w>h]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><C-w>j]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><C-w>k]], { noremap = true, silent = true })
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><C-w>l]], { noremap = true, silent = true })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<Tab>", ">>")
vim.keymap.set("n", "<S-Tab>", "<<")
vim.keymap.set("x", "<Tab>", ">gv")
vim.keymap.set("x", "<S-Tab>", "<gv")

vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")

-- Search for whatever is selected
vim.api.nvim_set_keymap("v", "/", 'y/\\V<C-R>"<CR><S-n>', { noremap = true })
-- Clear search completely
vim.api.nvim_set_keymap("n", "<leader>/", ':let @/ = ""<CR>:nohlsearch<CR>', { noremap = true, desc = "[C]lear [/]" })

-- Closing windows/buffers
-- Må ha plugin for Bwipeout
-- famiu/bufdelete.nvim
-- vim.keymap.set("n", "<C-q>", function() vim.cmd("q") end, { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-x>", function() vim.cmd("Bwipeout") end, { noremap = true, silent = true })

-- Toggle previous buffer
-- vim.keymap.set("n", "<Tab>", ":b#<CR>", { noremap = true, silent = true })

