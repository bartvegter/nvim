vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap

keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

keymap.set("n", "<M-j>", "<cmd>cnext<CR>", { desc = "Next quickfix item" })
keymap.set("n", "<M-k>", "<cmd>cprev<CR>", { desc = "Previous quickfix item" })
keymap.set("n", "<M-o>", "<cmd>copen<CR>", { desc = "Open quickfix window" })
keymap.set("n", "<M-c>", "<cmd>cclose<CR>", { desc = "Close quickfix window" })

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

keymap.set("n", "J", "mzJ'z", { desc = "Append line below" })

keymap.set("x", "<leader>p", '"_dP', { desc = "Paste w/o overriding paste buffer" })
keymap.set("v", "<leader>d", '"+_d', { desc = "Delete to void register" })
