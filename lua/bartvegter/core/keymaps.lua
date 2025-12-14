vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source file" })
-- vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Source current line" })
-- vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Source highlight" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Next quickfix item" })
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Previous quickfix item" })
vim.keymap.set("n", "<M-o>", "<cmd>copen<CR>", { desc = "Open quickfix window" })
vim.keymap.set("n", "<M-c>", "<cmd>cclose<CR>", { desc = "Close quickfix window" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

vim.keymap.set("n", "J", "mzJ'z", { desc = "Append line below" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste w/o overriding paste buffer" })
vim.keymap.set("v", "<leader>d", '"+_d', { desc = "Delete to void register" })
