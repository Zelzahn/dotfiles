-- OPTIONS --
local opt = vim.opt

opt.termguicolors = true -- better colors
opt.tabstop = 4 -- number of spaces in a <Tab>
opt.shiftwidth = 4 --
opt.softtabstop = 4 --
opt.expandtab = true --
opt.smartindent = true -- enable autoindents
opt.number = true -- enable line numbers
opt.relativenumber = true -- relative line numbers
opt.incsearch = true -- highlight matched strings while searching
opt.ignorecase = true -- case insensitive unless capitall letters are used
-- opt.spellang = { "en", "nl" } -- spelling for certain files
opt.fcs = "eob:\\" -- hide tildes at end of file
opt.cursorline = true -- highlight current line with a line
opt.showmode = false -- do not show default statusbar
opt.signcolumn = "yes" -- extra column showing sign
opt.breakindent = true -- wordwrap respects indent
