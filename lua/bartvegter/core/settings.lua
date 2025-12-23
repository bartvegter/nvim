local opt = vim.opt

-- System related options
opt.clipboard = "unnamedplus" -- Use system clipboard by default
opt.swapfile = false -- disables the nvim swapfile

-- Styling
vim.g.have_nerd_font = true -- enables nerd font support for icons
opt.relativenumber = true -- enable relative line numbers for effective motions
opt.signcolumn = "yes" -- always keep the sign column to stop text from shifting
opt.background = "dark" -- use dark colors for colorschemes that support it
opt.termguicolors = true -- improve colors for supporting terminals
opt.cursorline = true -- highlight the active line
opt.list = true -- enable the display of tabs, (trailing) spaces, etc.

-- Window management
opt.splitright = true
opt.splitbelow = true

-- Better indentation
opt.tabstop = 2 -- use 2 spaces for tabs
opt.shiftwidth = 2 -- use 2 spaces as indent width
opt.expandtab = true -- replace tabs with spaces
opt.autoindent = true -- copy indent from current line when starting a new line
opt.smartindent = true -- use smart indentation (extends autoindent)
opt.wrap = false -- disable line wrapping

opt.scrolloff = 25 -- keeps the active line somewhat centered when scrolling
opt.inccommand = "split" -- live preview of substitution

-- Improving search
opt.hlsearch = false -- disables persistent highlighting after search
opt.incsearch = true -- moves to search matches in real time
opt.ignorecase = true -- ignores case when searching
opt.smartcase = true -- override ignorecase option when searching with uppercase chars

-- Hiding the bar underneath the statusline (not needed due to lualine)
opt.laststatus = 0
opt.showmode = false
opt.showcmd = false
opt.shortmess = vim.opt.shortmess + "F"

-- Autocommand to highlight yanked lines
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
