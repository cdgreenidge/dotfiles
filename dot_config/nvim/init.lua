-- Vim Options
vim.g.mapleader = ","
-- Displays line number for the current line
vim.opt.number = true
-- Displays relative line numbers
vim.opt.relativenumber = true
-- Enables 24 bit RGB colors in the terminal
vim.opt.termguicolors = true
-- Number of spaces that a <Tab> character represents
vim.opt.tabstop = 4
-- Number of spaces to use for each step of automatic indentation
vim.opt.shiftwidth = 4
-- Number of spaces that a <Tab> counts for during editing operations
vim.opt.softtabstop = 4
-- Converts tabs into spaces when typing
vim.opt.expandtab = true
-- Automatically inserts an extra level of indentation in some cases
vim.opt.smartindent = true
-- Makes <Tab> insert 'shiftwidth' number of spaces at the start of a line
vim.opt.smarttab = true
-- Display vertical ruler at 80 columns
vim.opt.colorcolumn = "89"

-- Colorschemes & Aesthetics
vim.pack.add({ 
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" }
})
vim.cmd.colorscheme "catppuccin-macchiato"
