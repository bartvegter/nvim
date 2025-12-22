local keymap = vim.keymap

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>", { desc = "Source file" })
-- vim.keymap.set("n", "<space>x", ":.lua<CR>", { desc = "Source current line" })
-- vim.keymap.set("v", "<space>x", ":lua<CR>", { desc = "Source highlight" })

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

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab
