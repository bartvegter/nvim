local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.signcolumn = "yes" -- always keep the sign column to stop text from shifting

opt.background = "dark" -- use dark colors for colorschemes that support it
opt.termguicolors = true -- improve colors for supporting terminals

vim.g.have_nerd_font = true

opt.clipboard = "unnamedplus" -- Use system clipboard by default

opt.list = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.smartindent = true
opt.breakindent = true
opt.wrap = false

opt.swapfile = false

opt.cursorline = true

opt.scrolloff = 10

opt.inccommand = "split"

opt.mouse = "a"

-- Function to highlight the yanked lines
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

opt.hlsearch = false -- disables persistent highlighting after search
opt.incsearch = true -- moves to search matches in real time
opt.ignorecase = true -- ignores case when searching
opt.smartcase = true -- override ignorecase option when searching with uppercase chars
