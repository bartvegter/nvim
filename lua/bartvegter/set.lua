vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.g.have_nerd_font = true
vim.opt.termguicolors = true
vim.opt.clipboard = "unnamedplus"
vim.opt.updatetime = 100

vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.breakindent = true

vim.opt.scrolloff = 10

vim.opt.inccommand = "split"

vim.opt.mouse = "a"

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
